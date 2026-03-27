---@class amber.util
local M = {}

---Convert hex color to RGB values
---@param hex string Hex color (e.g., "#ff0000")
---@return number, number, number r, g, b values (0-255)
function M.hex_to_rgb(hex)
    hex = hex:gsub("#", "")
    return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

---Convert RGB values to hex color
---@param r number Red value (0-255)
---@param g number Green value (0-255)
---@param b number Blue value (0-255)
---@return string hex Hex color (e.g., "#ff0000")
function M.rgb_to_hex(r, g, b)
    return string.format("#%02x%02x%02x", math.floor(r + 0.5), math.floor(g + 0.5), math.floor(b + 0.5))
end

---Convert RGB to HSL
---@param r number Red value (0-255)
---@param g number Green value (0-255)
---@param b number Blue value (0-255)
---@return number, number, number h, s, l values (h: 0-360, s,l: 0-1)
function M.rgb_to_hsl(r, g, b)
    r = r / 255
    g = g / 255
    b = b / 255
    
    local max = math.max(r, g, b)
    local min = math.min(r, g, b)
    local h, s, l = 0, 0, (max + min) / 2
    
    if max == min then
        h, s = 0, 0 -- achromatic
    else
        local d = max - min
        s = l > 0.5 and d / (2 - max - min) or d / (max + min)
        
        if max == r then
            h = (g - b) / d + (g < b and 6 or 0)
        elseif max == g then
            h = (b - r) / d + 2
        elseif max == b then
            h = (r - g) / d + 4
        end
        h = h / 6
    end
    
    return h * 360, s, l
end

---Helper function for HSL to RGB conversion
---@param p number
---@param q number
---@param t number
---@return number
local function hue_to_rgb(p, q, t)
    if t < 0 then t = t + 1 end
    if t > 1 then t = t - 1 end
    if t < 1/6 then return p + (q - p) * 6 * t end
    if t < 1/2 then return q end
    if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
    return p
end

---Convert HSL to RGB
---@param h number Hue (0-360)
---@param s number Saturation (0-1)
---@param l number Lightness (0-1)
---@return number, number, number r, g, b values (0-255)
function M.hsl_to_rgb(h, s, l)
    h = h / 360
    local r, g, b
    
    if s == 0 then
        r, g, b = l, l, l -- achromatic
    else
        local q = l < 0.5 and l * (1 + s) or l + s - l * s
        local p = 2 * l - q
        r = hue_to_rgb(p, q, h + 1/3)
        g = hue_to_rgb(p, q, h)
        b = hue_to_rgb(p, q, h - 1/3)
    end
    
    return r * 255, g * 255, b * 255
end

---Shade a color (lighten or darken)
---@param color string Hex color
---@param amount number Amount to shade (-100 to 100, negative = darken, positive = lighten)
---@return string hex Shaded color
function M.shade(color, amount)
    local r, g, b = M.hex_to_rgb(color)
    local h, s, l = M.rgb_to_hsl(r, g, b)
    
    -- Adjust lightness
    l = l + (amount / 100)
    l = math.max(0, math.min(1, l)) -- clamp between 0 and 1
    
    r, g, b = M.hsl_to_rgb(h, s, l)
    return M.rgb_to_hex(r, g, b)
end

---Mix two colors
---@param color1 string First hex color
---@param color2 string Second hex color
---@param weight number Weight of first color (0-100)
---@return string hex Mixed color
function M.mix(color1, color2, weight)
    weight = weight / 100
    local w = weight * 2 - 1
    local a = 0 -- assuming no alpha
    local w1 = (w + a) / (1 + w * a)
    local w1 = (w1 + 1) / 2
    local w2 = 1 - w1
    
    local r1, g1, b1 = M.hex_to_rgb(color1)
    local r2, g2, b2 = M.hex_to_rgb(color2)
    
    local r = r1 * w1 + r2 * w2
    local g = g1 * w1 + g2 * w2
    local b = b1 * w1 + b2 * w2
    
    return M.rgb_to_hex(r, g, b)
end

---Lighten a color
---@param color string Hex color
---@param amount number Amount to lighten (0-100)
---@return string hex Lightened color
function M.lighten(color, amount)
    return M.shade(color, amount)
end

---Darken a color
---@param color string Hex color
---@param amount number Amount to darken (0-100)
---@return string hex Darkened color
function M.darken(color, amount)
    return M.shade(color, -amount)
end

---Blend foreground color with background using alpha
---@param fg string Foreground hex color
---@param alpha number Alpha value (0-1)
---@param bg string Background hex color
---@return string hex Blended color
function M.blend(fg, alpha, bg)
    local r1, g1, b1 = M.hex_to_rgb(fg)
    local r2, g2, b2 = M.hex_to_rgb(bg)
    
    local r = r1 * alpha + r2 * (1 - alpha)
    local g = g1 * alpha + g2 * (1 - alpha)
    local b = b1 * alpha + b2 * (1 - alpha)
    
    return M.rgb_to_hex(r, g, b)
end

return M