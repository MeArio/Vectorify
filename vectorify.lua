local class = require "middleclass"

local Vector = class("Vector")

function Vector:initialize(x, y)
    self.x = x
    self.y = y
end

function Vector.__add(a, b)
    return Vector:new(a.x + b.x, a.y + b.y)
end

function Vector.__sub(a, b)
    return Vector:new(a.x - b.x, a.y - b.y)
end

function Vector.__mul(a, b)
    if type(a) == "number" then
        return Vector:new(b.x * a, b.y * a)
    elseif type(b) == "number" then
        return Vector:new(a.x * b, a.y * b)
    else
        return Vector:new(a.x * b.x, a.y * b.y)
    end
end

function Vector:rotate(angle)
    self.x = self.x * math.cos(math.rad(angle)) - self.y * math.sin(math.rad(angle))
    self.y = self.x * math.sin(math.rad(angle)) + self.y * math.cos(math.rad(angle))
end

return Vector