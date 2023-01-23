local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi
local client = client

local bling = require("bling")

bling.widget.task_preview.enable {
  x = 120, -- The x-coord of the popup
  y = 120, -- The y-coord of the popup
  height = 400, -- The height of the popup
  width = 400, -- The width of the popup
  placement_fn = function(c) -- Place the widget using awful.placement (this overrides x & y)
    awful.placement.under_mouse(c, {
      margins = {
        top = 400,
        left = 300
      }
    })
  end,
  -- Your widget will automatically conform to the given size due to a constraint container.
  widget_structure = {
    {
      {
        {
          id = 'icon_role',
          widget = awful.widget.clienticon, -- The client icon
        },
        {
          id = 'name_role', -- The client name / title
          widget = wibox.widget.textbox,
        },
        layout = wibox.layout.flex.horizontal
      },
      widget = wibox.container.margin,
      margins = 5
    },
    {
      id = 'image_role', -- The client preview
      resize = true,
      valign = 'center',
      halign = 'center',
      widget = wibox.widget.imagebox,
    },
    layout = wibox.layout.fixed.vertical
  }
}

local tasklist = function(s)

  local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
      if c == client.focus then
        c.minimized = true
      else
        --c.first_tag:emit_signal("request::select")
        c:emit_signal(
          "request::activate",
          "tasklist",
          { raise = true }
        )
      end
    end),
    awful.button({}, 3, function()
      --awful.menu.client_list({ theme = { width = 250 } })
      return
    end),
    awful.button({}, 4, function()
      awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
      awful.client.focus.byidx(-1)
    end)
  )

  local widget_tasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    -- source = function()
    -- 	-- Get all clients
    -- 	local cls = client.get()

    -- 	-- Filter by an existing filter function and allowing only one client per class
    -- 	local result = {}
    -- 	local class_seen = {}
    -- 	for _, c in pairs(cls) do
    -- 		if awful.widget.tasklist.filter.alltags(c, s) then
    -- 			if not class_seen[c.class] then
    -- 				class_seen[c.class] = true
    -- 				table.insert(result, c)
    -- 			end
    -- 		end
    -- 	end
    -- 	return result
    -- end,
    buttons         = tasklist_buttons,
    layout          = {
      layout  = wibox.layout.fixed.horizontal,
      spacing = dpi(2)
    },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    -- not a widget instance.
    widget_template = {
      {
        {
          nil,
          {
            awful.widget.clienticon,
            left = dpi(5),
            right = dpi(2.5),
            widget = wibox.container.margin
          },
          {
            id = "background_role",
            forced_height = dpi(2),
            widget = wibox.container.background
          },
          nil,
          expand = "inside",
          widget = wibox.layout.align.vertical,
        },
        widget = wibox.container.background,
        id = "background"
      },
      widget = wibox.container.place,
      create_callback = function(self, c, index, objects)
        self:get_children_by_id('background')[1].bg = beautiful.bg_tasklist_active
        -- self:get_children_by_id('clienticon')[1].client = c

        -- BLING: Toggle the popup on hover and disable it off hover
        self:connect_signal('mouse::enter', function()
          awesome.emit_signal("bling::task_preview::visibility", s,
            true, c)
        end)
        self:connect_signal('mouse::leave', function()
          awesome.emit_signal("bling::task_preview::visibility", s,
            false, c)
        end)
      end,
      update_callback = function(self, c, index, objects)
        local widget_background = self:get_children_by_id("background")[1]
        if c.active then
          widget_background.bg = beautiful.bg_tasklist_active
        else
          widget_background.bg = beautiful.bg_transparent
        end
      end
    },
  }

  return widget_tasklist

end


function tasklist_container(s)
  return wibox.widget {
    widget = wibox.container.place,
    halign = "left",
    tasklist(s)
  }
end

return tasklist_container
