---------------------------------------------------------------------------
--- Dummy function for floating layout
--
-- @author Gregor Best
-- @copyright 2008 Gregor Best
-- @module awful.layout
---------------------------------------------------------------------------

-- Grab environment we need
local ipairs = ipairs
local math = math
--local capi =
--{
--    mouse = mouse,
--    mousegrabber = mousegrabber
--}

--- The floating layout layoutbox icon.
-- @beautiful beautiful.layout_floating
-- @param surface
-- @see gears.surface

local spiral = {}

--- Jump mouse cursor to the client's corner when resizing it.
--floating.resize_jump_to_corner = true
--
--function floating.mouse_resize_handler(c, corner, x, y)
--    local g = c:geometry()
--
--    -- Do not allow maximized clients to be resized by mouse
--    local fixed_x = c.maximized_horizontal
--    local fixed_y = c.maximized_vertical
--
--    local prev_coords = {}
--    local coordinates_delta = {x=0,y=0}
--    if floating.resize_jump_to_corner then
--      -- Warp mouse pointer
--      capi.mouse.coords({ x = x, y = y })
--    else
--      local corner_x, corner_y = x, y
--      local mouse_coords = capi.mouse.coords()
--      x = mouse_coords.x
--      y = mouse_coords.y
--      coordinates_delta = {x=corner_x-x,y=corner_y-y}
--    end
--
--    capi.mousegrabber.run(function (_mouse)
--        if not c.valid then return false end
--
--        _mouse.x = _mouse.x + coordinates_delta.x
--        _mouse.y = _mouse.y + coordinates_delta.y
--        for _, v in ipairs(_mouse.buttons) do
--            if v then
--                local ng
--                prev_coords = { x =_mouse.x, y = _mouse.y }
--                if corner == "bottom_right" then
--                    ng = { width = _mouse.x - g.x,
--                           height = _mouse.y - g.y }
--                elseif corner == "bottom_left" then
--                    ng = { x = _mouse.x,
--                           width = (g.x + g.width) - _mouse.x,
--                           height = _mouse.y - g.y }
--                elseif corner == "top_left" then
--                    ng = { x = _mouse.x,
--                           width = (g.x + g.width) - _mouse.x,
--                           y = _mouse.y,
--                           height = (g.y + g.height) - _mouse.y }
--                else
--                    ng = { width = _mouse.x - g.x,
--                           y = _mouse.y,
--                           height = (g.y + g.height) - _mouse.y }
--                end
--                if ng.width <= 0 then ng.width = nil end
--                if ng.height <= 0 then ng.height = nil end
--                if fixed_x then ng.width = g.width ng.x = g.x end
--                if fixed_y then ng.height = g.height ng.y = g.y end
--                c:geometry(ng)
--                -- Get real geometry that has been applied
--                -- in case we honor size hints
--                -- XXX: This should be rewritten when size
--                -- hints are available from Lua.
--                local rg = c:geometry()
--
--                if corner == "bottom_right" then
--                    ng = {}
--                elseif corner == "bottom_left" then
--                    ng = { x = (g.x + g.width) - rg.width  }
--                elseif corner == "top_left" then
--                    ng = { x = (g.x + g.width) - rg.width,
--                           y = (g.y + g.height) - rg.height }
--                else
--                    ng = { y = (g.y + g.height) - rg.height }
--                end
--                c:geometry({ x = ng.x, y = ng.y })
--                return true
--            end
--        end
--        return prev_coords.x == _mouse.x and prev_coords.y == _mouse.y
--    end, corner .. "_corner")
--end

local function do_spiral(p, _spiral)
    local wa = p.workarea
    local cls = p.clients
    local n = #cls
    local old_width, old_height = wa.width, 2 * wa.height

    for k, c in ipairs(cls) do
        if k % 2 == 0 then
            wa.width, old_width = math.ceil(old_width / 2), wa.width
            if k ~= n then
                wa.height, old_height = math.floor(wa.height / 2), wa.height
            end
        else
            wa.height, old_height = math.ceil(old_height / 2), wa.height
            if k ~= n then
                wa.width, old_width = math.floor(wa.width / 2), wa.width
            end
        end

        if k % 4 == 0 and _spiral then
            wa.x = wa.x - wa.width
        elseif k % 2 == 0 then
            wa.x = wa.x + old_width
        elseif k % 4 == 3 and k < n and _spiral then
            wa.x = wa.x + math.ceil(old_width / 2)
        end

        if k % 4 == 1 and k ~= 1 and _spiral then
            wa.y = wa.y - wa.height
        elseif k % 2 == 1 and k ~= 1 then
            wa.y = wa.y + old_height
        elseif k % 4 == 0 and k < n and _spiral then
            wa.y = wa.y + math.ceil(old_height / 2)
        end

        local g = {
            x = wa.x,
            y = wa.y,
            width = wa.width,
            height = wa.height
        }
        p.geometries[c] = g
    end
end

spiral.dwindle = {}
spiral.dwindle.name = "dwindle"
function spiral.dwindle.arrange(p)
    return do_spiral(p, false)
end

spiral.name = "spiral"
function spiral.arrange()
    return do_spiral(p, true)
end

--- The floating layout.
-- @clientlayout awful.layout.suit.


return spiral

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
