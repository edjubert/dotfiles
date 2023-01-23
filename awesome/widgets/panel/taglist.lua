local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local bling = require("bling")
local dpi = beautiful.xresources.apply_dpi
local client = client

bling.widget.tag_preview.enable {
  show_client_content = true,
  x = 10,
  y = 10,
  scale = 0.25,
  honor_padding = true,
  honor_workarea = true,
  placement_fn = function(c)
    awful.placement.under_mouse(c, {
      margins = {
        top = 400,
        -- left = 100
      }
    })
  end,
  background_widget = wibox.widget {
    image = beautiful.wallpaper,
    horizontal_fit_policy = "fit",
    vertical_fit_policy = "fit",
    widget = wibox.widget.imagebox
  }
}

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
      layout = bling.layout.equalarea,
      selected = selected,
    })
  end

  local tags = awful.widget.taglist {
    screen          = s,
    filter          = awful.widget.taglist.filter.all,
    buttons         = taglist_buttons,
    widget_template = {
      {
        {
          {
            {
              {
                id = 'index_role',
                widget = wibox.widget {
                  markup = ""
                },
              },
              margins = 3,
              widget  = wibox.container.margin,
            },
            -- bg     = '#dddddd',
            -- shape  = gears.shape.circle,
            widget = wibox.container.background,
          },
          {
            {
              id     = 'icon_role',
              widget = wibox.widget.imagebox,
            },
            margins = 1,
            widget  = wibox.container.margin,
          },
          {
            id     = 'text_role',
            widget = wibox.widget.textbox,
          },
          layout = wibox.layout.fixed.horizontal,
        },
        -- left   = 18,
        -- right  = 18,
        widget = wibox.container.margin
      },
      id              = 'background_role',
      widget          = wibox.container.background,
      -- Add support for hover colors and an index label
      create_callback = function(self, c3, index, objects) --luacheck: no unused args
        self:get_children_by_id('index_role')[1].markup = '<b> ' .. index .. ' </b>'
        self:connect_signal('mouse::enter', function()

          -- BLING: Only show widget when there are clients in the tag
          if #c3:clients() > 0 then
            -- BLING: Update the widget with the new tag
            awesome.emit_signal("bling::tag_preview::update", c3)
            -- BLING: Show the widget
            awesome.emit_signal("bling::tag_preview::visibility", s, true)
          end

          if self.bg ~= beautiful.bg_normal then
            self.backup     = self.bg
            self.has_backup = true
          end
          self.bg = beautiful.bg_normal
        end)
        self:connect_signal('mouse::leave', function()

          -- BLING: Turn the widget off
          awesome.emit_signal("bling::tag_preview::visibility", s, false)

          if self.has_backup then self.bg = self.backup end
        end)
      end,
      update_callback = function(self, c3, index, objects) --luacheck: no unused args
        self:get_children_by_id('index_role')[1].markup = '<b> ' .. index .. ' </b>'
      end,
    },
  }

  return wibox.widget {
    {
      tags,
      -- border_width = dpi(1),
      -- border_color = beautiful.bg_normal_alt,
      -- bg = beautiful.bg_button,
      shape = gears.shape.rounded_bar,
      widget = wibox.container.background,
    },
    margins = { top = dpi(4), bottom = dpi(4) },
    widget = wibox.container.margin,
  }

end

return taglist
