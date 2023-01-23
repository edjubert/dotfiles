local gears = require("gears")
local awful = require("awful")
local keys = require("configurations.keybindings.keys")


local clientkeys = gears.table.join(
-- Toggle fullscreen
  awful.key(
    { super, },
    "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "toggle fullscreen", group = "client" }
  ),

  -- Kill program
  awful.key(
    { super, shift },
    "c",
    function(c) c:kill() end,
    { description = "close", group = "client" }
  ),

  -- Toggle floating
  awful.key(
    { super, alt },
    "space",
    awful.client.floating.toggle,
    { description = "toggle floating", group = "client" }
  ),
  -- Swap with master
  awful.key(
    { super, ctrl },
    "Return",
    function(c) c:swap(awful.client.getmaster()) end,
    { description = "move to master", group = "client" }
  ),

  awful.key(
    { super, shift },
    "o",
    function(c) c:move_to_screen() end,
    { description = "move to screen", group = "client" }
  ),
  -- Toggle on top
  awful.key(
    { super, },
    "t",
    function(c) c.ontop = not c.ontop end,
    { description = "toggle keep on top", group = "client" }
  ),
  awful.key({ super, },
    keys.minimize,
    function(c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end,
    { description = "minimize", group = "client" }
  ),
  awful.key({ super, },
    "m",
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    { description = "(un)maximize", group = "client" }
  ),
  awful.key(
    { super, ctrl },
    "m",
    function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end,
    { description = "(un)maximize vertically", group = "client" }
  ),
  awful.key(
    { super, shift },
    "m",
    function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    { description = "(un)maximize horizontally", group = "client" }
  ),
  awful.key {
    modifiers   = { super },
    key         = 'g',
    description = 'set window as sticky',
    group       = 'client',
    on_press    = function(c) c.sticky = not c.sticky end
  }
)

return clientkeys
