require("Cocos2d")
require("PublicApi")

local GameEntity = class("GameEntity", function()
    return cc.Node:create()
end)

function GameEntity:ctor()
   self._model = nil
   self._radius = 0.0
   self._orientation = nil
   self._type = 0
end

---------------------------
--@return Node#Node model node
function GameEntity:getModel()
    return self._model
end

---------------------------
--remove this entity
function remove(remove)
	
end

---------------------------
--@return Vec3#Vec3 description
function getOrientation()
	return self._orientation
end

---------------------------
--setType
function setType(type)
	self._type = type
end

---------------------------
--@return #int get type
function getType()
    return self._type
end

---------------------------
--@return #float get radius
function getRadius()
    return self._radius
end

---------------------------
-- forward
function GameEntity:forward(dist)
    local f = PublicApi.degreeToRadians(self:getRotation())
    
    local x, y = self:getPosition()
    self:setPosition(cc.p(x + math.sin(f) * dist, y + math.cos(f) * dist))
end

---------------------------
-- forward
function GameEntity:forward(dist, angle)
    self:forward(dist)
end

return GameEntity
