/* See LICENSE file for copyright and license details. */

#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx = 1; /* border pixel of windows */
static const unsigned int default_border =
    0; /* to switch back to default border after dynamic border resizing via
          keybinds */
static const unsigned int snap = 32;   /* snap pixel */
static const unsigned int gappih = 20; /* horiz inner gap between windows */
static const unsigned int gappiv = 20; /* vert inner gap between windows */
static const unsigned int gappoh =
    10; /* horiz outer gap between windows and screen edge */
static const unsigned int gappov =
    10; /* vert outer gap between windows and screen edge */
static const int smartgaps =
    0; /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning =
    2; /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor
          X */
static const unsigned int systrayspacing = 8; /* systray spacing */
static const int systraypinningfailfirst =
    1; /* 1: if pinning fails,display systray on the 1st monitor,False: display
          systray on last monitor*/
static const int showsystray = 1; /* 0 means no systray */
static const int showbar = 1;     /* 0 means no bar */
static const int showtab = showtab_auto;
static const int toptab = 1;   /* 0 means bottom tab */
static const int floatbar = 1; /* 1 means the bar will float(don't have
                                  padding),0 means the bar have padding */
static const int topbar = 1;   /* 0 means bottom bar */
static const int horizpadbar = 5;
static const int vertpadbar = 11;
static const int vertpadtab = 35;
static const int horizpadtabi = 15;
static const int horizpadtabo = 15;
static const int scalepreview = 4;
static const int tag_preview = 1; /* 1 means enable, 0 is off */
static const int colorfultag =
    1; /* 0 means use SchemeSel for selected non vacant tag */

static const char *upvol[] = {"pamixer", "-i", "10", NULL};
static const char *downvol[] = {"pamixer", "-d", "10", NULL};
static const char *mutevol[] = {"pamixer", "-t", NULL};
static const char *playvol[] = {"pamixer", "play-pause", NULL};
static const char *nextvol[] = {"pamixer", "next", NULL};
static const char *prevvol[] = {"pamixer", "previous", NULL};

static const char *light_up[] = {"/usr/bin/light", "-A", "5", NULL};
static const char *light_down[] = {"/usr/bin/light", "-U", "5", NULL};
static const int new_window_attach_on_end =
    0; /*  1 means the new window will attach on the end; 0 means the new window
          will attach on the front,default is front */
#define ICONSIZE 19   /* icon size */
#define ICONSPACING 8 /* space between icon and title */

static const char *fonts[] = {
    "Iosevka Term NF:style:medium:size=12",
    "JetBrainsMono Nerd Font Mono:style:medium:size=19"};

// theme
#include "themes/tokyo_night.h"

static const char *colors[][3] = {
    /*                     fg       bg      border */
    [SchemeNorm] = {gray3, black, gray2},
    [SchemeSel] = {gray4, blue, blue},
    [SchemeTitle] = {white, black, black}, // active window title
    [TabSel] = {blue, gray2, black},
    [TabNorm] = {gray3, black, black},
    [SchemeTag] = {gray3, black, black},
    [SchemeTag1] = {blue, black, black},
    [SchemeTag2] = {red, black, black},
    [SchemeTag3] = {orange, black, black},
    [SchemeTag4] = {green, black, black},
    [SchemeTag5] = {pink, black, black},
    [SchemeLayout] = {blue, black, black},
    [SchemeBtnPrev] = {green, black, black},
    [SchemeBtnNext] = {yellow, black, black},
    [SchemeBtnClose] = {red, black, black},
};

/* tagging */
static char *tags[] = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

static const char *notif[] = {
    "/home/edjubert/.config/dwm/scripts/toggle_notification_center", NULL};
static const char *launcher[] = {"rofi", "-show", "drun", NULL};

static const Launcher launchers[] = {
    /* command     name to display */
    {notif, ""},
    {launcher, ""},
};

static const int tagschemes[] = {SchemeTag1, SchemeTag2, SchemeTag3,
                                 SchemeTag4, SchemeTag5, SchemeTag1,
                                 SchemeTag2, SchemeTag3, SchemeTag4};

static const unsigned int ulinepad =
    5; /* horizontal padding between the underline and tag */
static const unsigned int ulinestroke =
    2; /* thickness / height of the underline */
static const unsigned int ulinevoffset =
    0; /* how far above the bottom of the bar the line should appear */
static const int ulineall =
    0; /* 1 to show underline on all tags, 0 for just the active ones */

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     iscentered   isfloating
       monitor */
    // {"Gimp", NULL, NULL, 0, 0, 1, -1},
    {"brave", NULL, NULL, 1 << 8, 0, 0, -1},
    {"floating_term", NULL, NULL, 0, 0, 1},
};

/* layout(s) */
static const float mfact = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;    /* number of clients in master area */
static const int resizehints =
    0; /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen =
    1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT                                                           \
  1 /* nrowgrid layout: force two clients to always split vertically */
#include "functions.h"

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"况", tile}, /* first entry is default */
    {"頻", centeredmaster}, {"侀", spiral},    {"r侀", dwindle},
    {"H[]", deck},          {"充", bstack},    {"充", bstackhoriz},
    {"全", grid},           {"###", nrowgrid}, {"---", horizgrid},
    {"𤋮", gaplessgrid},    {"頻", monocle},   {"恵", centeredfloatingmaster},
    {"><>", NULL}, /* no layout function means floating behavior */
    {NULL, NULL},
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                      \
  {MODKEY, KEY, view, {.ui = 1 << TAG}},                                       \
      {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},               \
      {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},                        \
      {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
  {                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
  }

static const Key keys[] = {
    /* modifier                         key         function        argument */
    {0, XF86XK_AudioLowerVolume, spawn, {.v = downvol}},
    {0, XF86XK_AudioMute, spawn, {.v = mutevol}},
    {0, XF86XK_AudioRaiseVolume, spawn, {.v = upvol}},
    {0, XF86XK_AudioPlay, spawn, {.v = playvol}},
    {0, XF86XK_AudioNext, spawn, {.v = nextvol}},
    {0, XF86XK_AudioPrev, spawn, {.v = prevvol}},
    {0, XF86XK_MonBrightnessUp, spawn, {.v = light_up}},
    {0, XF86XK_MonBrightnessDown, spawn, {.v = light_down}},

    {MODKEY, XK_u, spawn, SHCMD("flameshot gui")},

    {MODKEY, XK_p, spawn, SHCMD("rofi -show drun")},
    {MODKEY, XK_r, spawn, SHCMD("rofi -show run")},
    {MODKEY, XK_Escape, spawn, SHCMD("rofi -show window")},
    {MODKEY, XK_Return, spawn, SHCMD("alacritty")},
    {MODKEY | ShiftMask, XK_Return, spawn,
     SHCMD("alacritty --class floating_term")},
    {MODKEY, XK_w, spawn, SHCMD("brave")},
    {MODKEY, XK_a, spawn,
     SHCMD("kill -s USR1 $(pidof deadd-notification-center)")},
    {MODKEY | ShiftMask, XK_v, spawn,
     SHCMD("rofi -modi \"clipboard:greenclip print\" -show clipboard "
           "-run-command \"{cmd}\" --config "
           "/home/edjubert/.config/dwm/rofi/config.rasi")},
    {MODKEY, XK_d, spawn,
     SHCMD("rofi -modi "
           "\"choose_sink:/home/edjubert/.config/awesome/scripts/"
           "sink_chooser\" -show choose_sink")},
    {MODKEY | ShiftMask, XK_d, spawn,
     SHCMD("rofi -modi "
           "\"source_sink:/home/edjubert/.config/awesome/scripts/"
           "source_chooser\" -show source_sink")},
    {MODKEY, XK_c, spawn,
     SHCMD("rofi -modi "
           "\"choose_layout:/home/edjubert/.config/awesome/scripts/"
           "keyboardLayoutChooser\" -show choose_layout")},
    {MODKEY | ShiftMask, XK_p, spawn, SHCMD("flameshot gui")},

    // toggle stuff
    {MODKEY, XK_b, togglebar, {0}},
    {MODKEY | ControlMask, XK_t, togglegaps, {0}},
    {MODKEY, XK_space, togglefloating, {0}},
    {MODKEY, XK_f, togglefullscr, {0}},

    {MODKEY | ControlMask, XK_w, tabmode, {-1}},
    {MODKEY, XK_n, focusstack, {.i = +1}},
    {MODKEY, XK_e, focusstack, {.i = -1}},
    {MODKEY | ControlMask, XK_i, incnmaster, {.i = +1}},
    {MODKEY | ControlMask, XK_h, incnmaster, {.i = -1}},

    // shift view
    {MODKEY, XK_Left, shiftview, {.i = -1}},
    {MODKEY, XK_Right, shiftview, {.i = +1}},

    // change m,cfact sizes
    {MODKEY, XK_h, setmfact, {.f = -0.05}},
    {MODKEY, XK_i, setmfact, {.f = +0.05}},
    {MODKEY | ShiftMask, XK_h, setcfact, {.f = +0.25}},
    {MODKEY | ShiftMask, XK_i, setcfact, {.f = -0.25}},
    // {MODKEY | ShiftMask, XK_o, setcfact, {.f = 0.00}},

    {MODKEY | ShiftMask, XK_n, movestack, {.i = +1}},
    {MODKEY | ShiftMask, XK_e, movestack, {.i = -1}},
    {MODKEY | ShiftMask, XK_Return, zoom, {0}},
    {MODKEY, XK_Tab, view, {0}},

    {MODKEY | ControlMask | ShiftMask, XK_d, defaultgaps, {0}},

    // layout
    {MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY | ShiftMask, XK_f, setlayout, {.v = &layouts[1]}},
    {MODKEY, XK_m, setlayout, {.v = &layouts[2]}},
    {MODKEY | ControlMask, XK_g, setlayout, {.v = &layouts[10]}},
    {MODKEY | ControlMask | ShiftMask, XK_t, setlayout, {.v = &layouts[13]}},
    {MODKEY | ShiftMask, XK_space, setlayout, {0}},
    {MODKEY, XK_k, cyclelayout, {.i = +1}},
    {MODKEY | ShiftMask, XK_k, cyclelayout, {.i = -1}},
    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},
    {MODKEY, XK_o, focusmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_o, tagmon, {.i = +1}},
    // {MODKEY, XK_comma, focusmon, {.i = -1}},
    // {MODKEY, XK_period, focusmon, {.i = +1}},
    // {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    // {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},

    // change border size
    {MODKEY | ShiftMask, XK_minus, setborderpx, {.i = -1}},
    {MODKEY, XK_minus, setborderpx, {.i = +1}},
    {MODKEY | ShiftMask, XK_w, setborderpx, {.i = default_border}},

    // kill dwm
    {MODKEY | ControlMask, XK_q, spawn, SHCMD("killall bar.sh dwm")},

    // kill window
    {MODKEY | ShiftMask, XK_c, killclient, {0}},

    // restart
    {MODKEY | ShiftMask, XK_r, restart, {0}},

    // hide & restore windows
    {MODKEY, XK_s, hidewin, {0}},
    {MODKEY | ShiftMask, XK_s, restorewin, {0}},

    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
        TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
            TAGKEYS(XK_9, 8)};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
    /* click                event mask      button          function argument */
    {ClkLtSymbol, 0, Button1, cyclelayout, {.i = +1}},
    {ClkLtSymbol, 0, Button3, cyclelayout, {.i = -1}},
    {ClkWinTitle, 0, Button3, zoom, {0}},
    {ClkStatusText, 0, Button3, spawn, SHCMD("alacritty")},

    /* Keep movemouse? */
    /* { ClkClientWin,         MODKEY,         Button1,        movemouse, {0} },
     */

    /* placemouse options, choose which feels more natural:
     *    0 - tiled position is relative to mouse cursor
     *    1 - tiled position is relative to window center
     *    2 - mouse pointer warps to window center
     *
     * The moveorplace uses movemouse or placemouse depending on the floating
     * state of the selected client. Set up individual keybindings for the two
     * if you want to control these separately (i.e. to retain the feature to
     * move a tiled window into a floating position).
     */
    {ClkClientWin, MODKEY, Button1, moveorplace, {.i = 0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    {ClkClientWin, ControlMask, Button1, dragmfact, {0}},
    {ClkClientWin, ControlMask, Button3, dragcfact, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
    {ClkTabBar, 0, Button1, focuswin, {0}},
    {ClkTabPrev, 0, Button1, movestack, {.i = -1}},
    {ClkTabNext, 0, Button1, movestack, {.i = +1}},
    {ClkTabClose, 0, Button1, killclient, {0}},
};