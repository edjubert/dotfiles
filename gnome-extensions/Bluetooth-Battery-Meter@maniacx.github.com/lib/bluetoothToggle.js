'use strict';
import Gio from 'gi://Gio';
import GLib from 'gi://GLib';
import GObject from 'gi://GObject';
import St from 'gi://St';
import * as Main from 'resource:///org/gnome/shell/ui/main.js';
import {ngettext} from 'resource:///org/gnome/shell/extensions/extension.js';
import {BluetoothIndicator} from './bluetoothIndicator.js';
import {BluetoothDeviceItem} from './bluetoothPopupMenu.js';

const QuickSettingsMenu = Main.panel.statusArea.quickSettings;
const supportedIcons = [
    'audio-speakers',
    'audio-headphones',
    'audio-headset',
    'input-gaming',
    'input-keyboard',
    'input-mouse',
    'input-tablet',
    'phone-apple-iphone',
    'phone-samsung-galaxy-s',
    'phone-google-nexus-one',
    'phone',
];

export const BluetoothBatteryMeter = GObject.registerClass({
}, class BluetoothBatteryMeter extends GObject.Object {
    constructor(settings, extensionPath) {
        super();
        this._extensionPath = extensionPath;
        this._settings = settings;

        this._idleTimerId = GLib.idle_add(GLib.PRIORITY_LOW, () => {
            if (!Main.panel.statusArea.quickSettings._bluetooth &&
                Main.panel.statusArea.quickSettings._bluetooth.quickSettingsItems[0]._box.get_first_child().get_stage())
                return GLib.SOURCE_CONTINUE;
            this._bluetoothToggle = Main.panel.statusArea.quickSettings._bluetooth.quickSettingsItems[0];
            this._startBluetoothToggle();
            return GLib.SOURCE_REMOVE;
        });
    }

    _startBluetoothToggle() {
        this._idleTimerId = null;
        this._deviceItems = new Map();
        this._deviceIndicators = new Map();
        this._pairedBatteryDevices = new Map();
        this._removedDeviceList = [];
        this._colorsAssigned = false;
        this._connectedColor = '#8fbbf0';
        this._disconnectedColor = '#ffffff';
        this._pullDevicesFromGsetting();
        this._showBatteryPercentage = this._settings.get_boolean('enable-battery-level-text');
        this._showBatteryIcon = this._settings.get_boolean('enable-battery-level-icon');
        this._swapIconText = this._settings.get_boolean('swap-icon-text');

        this._originalSync = this._bluetoothToggle._sync;
        this._bluetoothToggle._sync = () => {
            this._sync();
        };
        this._originalRemoveDevice = this._bluetoothToggle._removeDevice;
        this._bluetoothToggle._removeDevice = path => {
            this._removeDevice(path);
        };
        this._bluetoothToggle._onActiveChanged();
        this._originalOnActiveChanged = this._bluetoothToggle._onActiveChanged;
        this._bluetoothToggle._onActiveChanged = () => {
            this._onActiveChanged();
        };

        this._themeContext = St.ThemeContext.get_for_stage(global.stage);
        this._themeConnectId = this._themeContext.connect('changed', () => {
            this._colorsAssigned = false;
            this._onActiveChanged();
        });

        this._desktopSettings = new Gio.Settings({schema_id: 'org.gnome.desktop.interface'});
        this._desktopSettings.connectObject(
            'changed::text-scaling-factor', () => {
                this._onActiveChanged();
            },
            this
        );

        this._settings.connectObject(
            'changed::enable-battery-indicator', () => {
                if (this._settings.get_boolean('enable-battery-indicator'))
                    this._sync();
                else
                    this._destroyIndicators();
            },
            'changed::enable-battery-level-text', () => {
                this._showBatteryPercentage = this._settings.get_boolean('enable-battery-level-text');
                this._onActiveChanged();
            },
            'changed::enable-battery-level-icon', () => {
                this._showBatteryIcon = this._settings.get_boolean('enable-battery-level-icon');
                this._onActiveChanged();
            },
            'changed::swap-icon-text', () => {
                this._swapIconText = this._settings.get_boolean('swap-icon-text');
                this._onActiveChanged();
            },
            'changed::paired-supported-device-list', () => {
                this._pullDevicesFromGsetting();
                this._sync();
            },
            this
        );

        this._onActiveChanged();
    }

    _removeDevice(path) {
        this._removedDeviceList.push(path);
        if (this._pairedBatteryDevices.has(path)) {
            const props = this._pairedBatteryDevices.get(path);
            props.paired = false;
            this._pairedBatteryDevices.set(path, props);
            this._pushDevicesToGsetting();
        }
        this._deviceItems.get(path)?.destroy();
        this._deviceItems.delete(path);
        this._deviceIndicators.get(path)?.destroy();
        this._deviceIndicators.delete(path);
        this._updateDeviceVisibility();
    }

    _updateDeviceVisibility() {
        this._bluetoothToggle._deviceSection.actor.visible =
            [...this._deviceItems.values()].some(item => item.visible);
    }

    _onActiveChanged() {
        if (!this._colorsAssigned && this._bluetoothToggle.checked) {
            this._getColor();
        } else {
            this._bluetoothToggle._updatePlaceholder();
            this._deviceItems.forEach(item => item.destroy());
            this._deviceItems.clear();
            this._sync();
        }
    }

    _pullDevicesFromGsetting() {
        this._pairedBatteryDevices.clear();
        const deviceList = this._settings.get_strv('paired-supported-device-list');
        if (deviceList.length !== 0) {
            for (const jsonString of deviceList) {
                const item = JSON.parse(jsonString);
                const path = item.path;
                const props = {
                    'icon': item['icon'],
                    'alias': item['alias'],
                    'paired': item['paired'],
                    'batteryEnabled': item['battery-enabled'],
                    'indicatorEnabled': item['indicator-enabled'],
                };
                this._pairedBatteryDevices.set(path, props);
            }
        }
    }

    _pushDevicesToGsetting() {
        const deviceList = [];
        for (const [path, props] of this._pairedBatteryDevices) {
            const item = {
                path,
                'icon': props.icon,
                'alias': props.alias,
                'paired': props.paired,
                'battery-enabled': props.batteryEnabled,
                'indicator-enabled': props.indicatorEnabled,
            };
            deviceList.push(JSON.stringify(item));
        }
        this._settings.set_strv('paired-supported-device-list', deviceList);
    }

    addBatterySupportedDevices(device) {
        const path = device.get_object_path();
        const props = {
            icon: device.icon,
            alias: device.alias,
            paired: true,
            batteryEnabled: true,
            indicatorEnabled: true,
        };
        this._pairedBatteryDevices.set(path, props);
        this._delayedUpdateDeviceGsettings();
    }

    _delayedUpdateDeviceGsettings() {
        if (this._delayedTimerId)
            GLib.source_remove(this._delayedTimerId);
        this._delayedTimerId = GLib.timeout_add(GLib.PRIORITY_DEFAULT, 300, () => {
            this._pushDevicesToGsetting();
            this._delayedTimerId = null;
            return GLib.SOURCE_REMOVE;
        });
    }

    _sync() {
        const devices = this._bluetoothToggle._getSortedDevices();
        if (this._removedDeviceList.length > 0) {
            const pathsInDevices = new Set(devices.map(dev => dev.get_object_path()));
            this._removedDeviceList = this._removedDeviceList.filter(path => pathsInDevices.has(path));
        }

        for (const dev of devices) {
            const path = dev.get_object_path();
            if (this._deviceItems.has(path)) {
                if (this._pairedBatteryDevices.has(path)) {
                    const item = this._deviceItems.get(path);
                    item.updateProps(this._pairedBatteryDevices.get(path).batteryEnabled);
                }
                continue;
            }
            if (this._removedDeviceList.length > 0) {
                const pathIndex = this._removedDeviceList.indexOf(path);
                if (pathIndex > -1) {
                    if (dev.connected)
                        this._removedDeviceList.splice(pathIndex, 1);
                    else
                        continue;
                }
            }

            let batteryInfoReported = false;
            let props = {};
            const iconCompatible = supportedIcons.includes(dev.icon);
            if (iconCompatible) {
                if (this._pairedBatteryDevices.has(path)) {
                    let updateGsettingPairedList = false;
                    props = this._pairedBatteryDevices.get(path);
                    if (props.alias !== dev.alias) {
                        props.alias = dev.alias;
                        updateGsettingPairedList = true;
                    }
                    if (props.paired !== dev.paired) {
                        props.paired = dev.paired;
                        updateGsettingPairedList = true;
                    }
                    if (updateGsettingPairedList)
                        this._delayedUpdateDeviceGsettings();
                    batteryInfoReported = true;
                } else if (dev.battery_percentage > 0) {
                    this.addBatterySupportedDevices(dev);
                    batteryInfoReported = true;
                }
            }

            const item = new BluetoothDeviceItem(this, dev, iconCompatible, batteryInfoReported);
            item.connect('notify::visible', () => this._updateDeviceVisibility());
            if (batteryInfoReported)
                item.updateProps(props.batteryEnabled);
            else
                item.updateProps(false);
            this._bluetoothToggle._deviceSection.addMenuItem(item);
            this._deviceItems.set(path, item);
        }

        if (this._settings.get_boolean('enable-battery-indicator')) {
            for (const dev of devices) {
                const path = dev.get_object_path();
                if (this._deviceIndicators.has(path)) {
                    if (!dev.connected || !this._pairedBatteryDevices.get(path).indicatorEnabled) {
                        this._deviceIndicators.get(path)?.destroy();
                        this._deviceIndicators.delete(path);
                    }
                    continue;
                }
                if (!dev.connected)
                    continue;
                if (this._pairedBatteryDevices.has(path) && this._pairedBatteryDevices.get(path).indicatorEnabled) {
                    const indicator = new BluetoothIndicator(this._settings, dev, this._extensionPath);
                    QuickSettingsMenu.addExternalIndicator(indicator);
                    this._deviceIndicators.set(path, indicator);
                }
            }
        }

        const connectedDevices = devices.filter(dev => dev.connected);
        const nConnected = connectedDevices.length;

        if (nConnected > 1)

            this._bluetoothToggle.subtitle = ngettext('%d Connected', '%d Connected', nConnected).format(nConnected);
        else if (nConnected === 1)
            this._bluetoothToggle.subtitle = connectedDevices[0].alias;
        else
            this._bluetoothToggle.subtitle = null;

        this._updateDeviceVisibility();
    }

    _getColor() {
        const toggleButton = this._bluetoothToggle._box.get_first_child();
        const accentRGB = toggleButton.get_theme_node().get_background_color();
        const panelBackgroundRGB = Main.panel.statusArea.quickSettings.menu.box.get_theme_node().get_background_color();
        const panelForegroundRGB = Main.panel.statusArea.quickSettings.menu.box.get_theme_node().get_foreground_color();
        const panelBackgroundLuminance = rgbToHsl(panelBackgroundRGB.red, panelBackgroundRGB.green, panelBackgroundRGB.blue).l;
        const adjustLuminanceFactor = panelBackgroundLuminance < 40 ? 20 : -10;
        const accentHSL =  rgbToHsl(accentRGB.red, accentRGB.green, accentRGB.blue);
        const accentLuminanceAdjusted = accentHSL.l + adjustLuminanceFactor;
        this._connectedColor = hslToRgbHex(accentHSL.h, accentHSL.s, accentLuminanceAdjusted);
        this._disconnectedColor = panelForegroundRGB.to_string().substring(0, 7);
        this._colorsAssigned = true;
        this._onActiveChanged();
    }

    _destroyIndicators() {
        if (this._deviceIndicators) {
            this._deviceIndicators.forEach(indicator => indicator?.destroy());
            this._deviceIndicators.clear();
        }
    }

    _destroyPopupMenuItems() {
        if (this._deviceItems) {
            this._deviceItems.forEach(item => item.destroy());
            this._deviceItems.clear();
        }
    }

    destroy() {
        if (this._idleTimerId)
            GLib.source_remove(this._idleTimerId);
        this._idleTimerId = null;
        if (this._themeConnectId)
            this._themeContext.disconnect(this._themeConnectId);
        this._themeContext = null;
        this._settings.disconnectObject(this);
        if (this._delayedTimerId)
            GLib.source_remove(this._delayedTimerId);
        this._delayedTimerId = null;
        if (this._desktopSettings)
            this._desktopSettings.disconnectObject(this);
        this._destroyIndicators();
        this._deviceIndicators = null;
        this._destroyPopupMenuItems();
        this._deviceItems = null;
        this._pairedBatteryDevices = null;
        this._desktopSettings = null;
        this._settings = null;
        if (this._bluetoothToggle && this._originalRemoveDevice)
            this._bluetoothToggle._removeDevice = this._originalRemoveDevice;
        this._originalRemoveDevice = null;
        if (this._bluetoothToggle && this._originalSync)
            this._bluetoothToggle._sync = this._originalSync;
        this._originalSync = null;
        if (this._bluetoothToggle && this._originalOnActiveChanged)
            this._bluetoothToggle._onActiveChanged = this._originalOnActiveChanged;
        this._originalRemoveDevice = null;
        this._bluetoothToggle?._onActiveChanged();
    }
});

function rgbToHsl(r, g, b) {
    r /= 255;
    g /= 255;
    b /= 255;
    const max = Math.max(r, g, b);
    const min = Math.min(r, g, b);
    let h, s;
    const l = (max + min) / 2;

    if (max === min) {
        h = s = 0;
    } else {
        const delta = max - min;
        s = l > 0.5 ? delta / (2 - max - min) : delta / (max + min);
        switch (max) {
            case r:
                h = (g - b) / delta + (g < b ? 6 : 0);
                break;
            case g:
                h = (b - r) / delta + 2;
                break;
            case b:
                h = (r - g) / delta + 4;
                break;
        }
        h /= 6;
    }
    return {
        h: h * 360,
        s: s * 100,
        l: l * 100,
    };
}

function hslToRgbHex(h, s, l) {
    h /= 360;
    s /= 100;
    l /= 100;
    let r, g, b;
    if (s === 0) {
        r = g = b = l;
    } else {
        const hue2rgb = (p, q, t) => {
            if (t < 0)
                t += 1;
            if (t > 1)
                t -= 1;
            if (t < 1 / 6)
                return p + (q - p) * 6 * t;
            if (t < 1 / 2)
                return q;
            if (t < 2 / 3)
                return p + (q - p) * (2 / 3 - t) * 6;
            return p;
        };
        const q = l < 0.5 ? l * (1 + s) : l + s - l * s;
        const p = 2 * l - q;
        r = hue2rgb(p, q, h + 1 / 3);
        g = hue2rgb(p, q, h);
        b = hue2rgb(p, q, h - 1 / 3);
    }
    const hex = `#${((1 << 24) + (Math.round(r * 255) << 16) + (Math.round(g * 255) << 8) + Math.round(b * 255)).toString(16).slice(1)}`;
    return hex;
}
