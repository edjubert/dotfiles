local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local client = client

local taglist = function(s)

  local taglist_buttons = gears.table.join(
    awful.button({}, 1, function(t) t:view_only() end),
    awful.button({ super }, 1, function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end),
    awful.button({}, 3, awful.tag.viewtoggle),
    awful.button({ super }, 3, function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end),
    awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end),
    awful.button({}, 6, function(t) awful.tag.viewprev(t.screen) end),
    awful.button({}, 7, function(t) awful.tag.viewprev(t.screen) end),
    awful.button({}, 8, function(t) awful.tag.viewprev(t.screen) end),
    awful.button({}, 9, function(t) awful.tag.viewprev(t.screen) end)
  )

  -- Each screen has its own tag table.
  local tag_names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
  for idx, name in ipairs(tag_names) do
    local selected = false
    if idx == 1 then
      selected = true
    end

    awful.tag.add(name, {
      screen = s,
      layout = awful.layout.suit.tile,
      selected = selected,
    })
  end

  local tags = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
  }

  return wibox.widget {
    {
      tags,
      --border_width = dpi(1),
      --border_color = beautiful.bg_normal_alt,
      --bg = beautiful.bg_button,
      --shape = gears.shape.rounded_bar,
      widget = wibox.container.background
    },
    margins = { top = dpi(4), bottom = dpi(4) },
    widget = wibox.container.margin
  }

end

return taglist
