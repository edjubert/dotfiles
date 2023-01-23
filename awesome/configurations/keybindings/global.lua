local gears = require("gears");
local awful = require("awful");
local awesome = awesome
local hotkeys_popup = require("awful.hotkeys_popup")
local default_apps = require("configurations.default-apps")
local keys = require("configurations.keybindings.keys")
require('awful.autofocus')

local notifyPlayerctl = function()
  awful.spawn.easy_async_with_shell('playerctl metadata --format "{{ mpris:artUrl }}"', function(artUrl)
    awful.spawn.easy_async_with_shell('playerctl metadata --format "{{ status }}\n\n{{ artist }}\n{{ title }}"',
      function(stdout)
        naughty.notify({
          text = stdout,
          icon = artUrl,
          icon_size = 100
        })
      end)
  end)
end

local playerctlActions = function(action)
  if action == 'play' then awful.util.spawn('playerctl play-pause')
  elseif action == 'next' then awful.util.spawn('playerctl next')
  elseif action == 'prev' then awful.util.spawn('playerctl previous')
  end

  notifyPlayerctl()
end


local globalkeys = gears.table.join(
  awful.key(
    { super, },
    "s",
    hotkeys_popup.show_help,
    { description = "show help", group = "awesome" }
  ),
  awful.key(
    { super, },
    "Escape",
    awful.tag.history.restore,
    { description = "go back", group = "tag" }
  ),

  -- TODO: Will be used for toggling tabbed layout
  awful.key(
    { super, },
    "w",
    function() awful.spawn('firefox') end,
    { description = "show firefox", group = "launcher" }
  ),

  -- Layout manipulation
  -- Swap client
  awful.key(
    { super, shift },
    keys.down,
    function() awful.client.swap.byidx(1) end,
    { description = "swap with next client by index", group = "client" }
  ),
  awful.key(
    { super, shift },
    "Left",
    function() awful.client.swap.byidx(1) end,
    { description = "swap with next client by index", group = "client" }
  ),
  awful.key(
    { super, shift },
    keys.up,
    function() awful.client.swap.byidx(-1) end,
    { description = "swap with previous client by index", group = "client" }
  ),
  awful.key(
    { super, shift },
    "Right",
    function() awful.client.swap.byidx(-1) end,
    { description = "swap with previous client by index", group = "client" }
  ),
  -- Focus client
  awful.key(
    { super, },
    keys.down,
    function()
      awful.client.focus.byidx(1)
    end,
    { description = "focus next by index", group = "client" }
  ),
  awful.key(
    { super, },
    "Right",
    awful.tag.viewnext,
    { description = "focus next by index", group = "client" }
  ),
  awful.key(
    { super, },
    keys.up,
    function()
      awful.client.focus.byidx(-1)
    end,
    { description = "focus previous by index", group = "client" }
  ),
  awful.key(
    { super, }, "Left",
    awful.tag.viewprev,
    { description = "focus previous by index", group = "client" }
  ),
  -- Relative focus
  awful.key(
    { super },
    "o",
    function() awful.screen.focus_relative(1) end,
    { description = "focus the next screen", group = "screen" }
  ),
  awful.key(
    { super, ctrl },
    keys.up,
    function() awful.screen.focus_relative(-1) end,
    { description = "focus the previous screen", group = "screen" }
  ),
  -- Focus previous
  awful.key(
    { super, },
    "Tab",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    { description = "go back", group = "client" }
  ),
  awful.key(
    { super, },
    "u", awful.client.urgent.jumpto,
    { description = "jump to urgent client", group = "client" }
  ),

  -- Standard program
  awful.key(
    { super, },
    "Return",
    function() awful.spawn(terminal) end,
    { description = "open a terminal", group = "launcher" }
  ),
  awful.key(
    { super, shift },
    "r",
    awesome.restart,
    { description = "reload awesome", group = "awesome" }
  ),
  awful.key(
    { super },
    "q",
    function()
      awesome.emit_signal('module::exit_screen:show')
    end,
    { description = "Launch exit screen", group = "launcher" }
  ),
  -- Client resize master
  awful.key(
    { super, ctrl },
    "Right",
    function() awful.tag.incmwfact(0.05) end,
    { description = "increase master width factor", group = "layout" }
  ),
  awful.key({ super, ctrl },
    keys.left,
    function() awful.tag.incmwfact(-0.05) end,
    { description = "decrease master width factor", group = "layout" }
  ),
  awful.key({ super, ctrl },
    "Left",
    function() awful.tag.incmwfact(-0.05) end,
    { description = "decrease master width factor", group = "layout" }
  ),
  -- Client resize
  awful.key({ super, ctrl },
    keys.up,
    function() awful.client.incwfact(0.50) end,
    { description = "decrease master width factor", group = "layout" }
  ),
  awful.key({ super, ctrl },
    "Up",
    function() awful.client.incwfact(0.50) end,
    { description = "decrease master width factor", group = "layout" }
  ),
  awful.key({ super, ctrl },
    "Down",
    function() awful.client.incwfact(-0.50) end,
    { description = "decrease master width factor", group = "layout" }
  ),
  awful.key({ super, ctrl },
    keys.down,
    function() awful.client.incwfact(-0.50) end,
    { description = "decrease master width factor", group = "layout" }
  ),
  -- Increase/Decrease numbers of master
  awful.key(
    { super, shift },
    keys.left,
    function() awful.tag.incnmaster(1, nil, true) end,
    { description = "increase the number of master clients", group = "layout" }
  ),
  awful.key(
    { super, shift },
    keys.right,
    function() awful.tag.incnmaster(-1, nil, true) end,
    { description = "decrease the number of master clients", group = "layout" }
  ),

  -- Increase/Decrease numbers of columns
  awful.key(
    { super, ctrl },
    "+",
    function() awful.tag.incncol(1, nil, true) end,
    { description = "increase the number of columns", group = "layout" }
  ),
  awful.key(
    { super, ctrl },
    "-",
    function() awful.tag.incncol(-1, nil, true) end,
    { description = "decrease the number of columns", group = "layout" }
  ),

  -- Next layout
  awful.key(
    { super, },
    "space",
    function() awful.layout.inc(1) end,
    { description = "select next", group = "layout" }
  ),

  -- Previous layout
  awful.key(
    { super, shift },
    "space",
    function() awful.layout.inc(-1) end,
    { description = "select previous", group = "layout" }
  ),

  awful.key(
    { super, shift },
    keys.minimize,
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal(
          "request::activate", "key.unminimize", { raise = true }
        )
      end
    end,
    { description = "restore minimized", group = "client" }
  ),


  -- Prompt
  awful.key(
    { super },
    "r",
    function() awful.screen.focused().mypromptbox:run() end,
    { description = "run prompt", group = "launcher" }
  ),

  awful.key(
    { super },
    "x",
    function()
      awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    { description = "lua execute prompt", group = "awesome" }
  ),
  -- My keybindings
  awful.key(
    { super },
    "p",
    --function() awful.spawn("rofi -show drun -columns 2 -theme codeDark -no-show-icons") end
    function() awful.spawn(default_apps.app_menu, false) end,
    { description = "Application launcher", group = 'launcher' }
  ),

  awful.key {
    modifiers = {},
    key = "XF86AudioRaiseVolume",
    description = "Increase volume",
    group = "audio",
    on_press = function()
      awful.util.spawn('pamixer -i 10')
    end
  },
  awful.key {
    modifiers = {},
    key = "XF86AudioLowerVolume",
    description = "Decrease volume",
    group = "audio",
    on_press = function()
      awful.util.spawn('pamixer -d 10')
    end
  },
  awful.key {
    modifiers = {},
    key = "XF86AudioMute",
    description = "Mute volume",
    group = "audio",
    on_press = function()
      awful.util.spawn('pamixer -t')
    end
  },
  awful.key {
    modifiers = {},
    key = "XF86AudioPlay",
    description = "Play/Pause music",
    group = "audio",
    on_press = function()
      playerctlActions('play')
    end
  },
  awful.key {
    modifiers = {},
    key = "XF86AudioNext",
    description = "Next track",
    group = "audio",
    on_press = function()
      playerctlActions('next')
    end
  },
  awful.key {
    modifiers = {},
    key = "XF86AudioPrev",
    description = "Prev track",
    group = "audio",
    on_press = function()
      playerctlActions('prev')
    end
  },
  awful.key(
    {},
    'XF86MonBrightnessUp',
    function()
      awful.spawn('xbacklight -inc 10', false)
      awesome.emit_signal("update::brigtness")
    end,
    { description = 'increase brightness by 10%', group = 'hotkeys' }
  ),
  awful.key(
    {},
    'XF86MonBrightnessDown',
    function()
      awful.spawn('xbacklight -dec 10', false)
      awesome.emit_signal("update::brigtness")
    end,
    { description = 'decrease brightness by 10%', group = 'hotkeys' }
  ),
  awful.key(
    {},
    'XF86Display',
    function()
      awful.spawn.single_instance('kcmshell5 kcm_kscreen', false)
    end,
    { description = 'Display configuration', group = 'hotkeys' }
  ),

  awful.key {
    modifiers = { super, shift },
    key = "v",
    description = "Open greenclip",
    group = "clipboard",
    on_press = function()
      awful.util.spawn('rofi -modi "clipboard:greenclip print" -show clipboard -run-command "{cmd}"')
    end
  },
  awful.key {
    modifiers = { super, shift },
    key = 'p',
    description = "Take a screenshot with flameshot",
    group = 'screenshot',
    on_press = function()
      awful.util.spawn('flameshot gui')
    end
  }
)

return globalkeys
