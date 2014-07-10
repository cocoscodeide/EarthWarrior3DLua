require("AirCraft")
require("GameLayer")

local AirCraft = class("Foldder", function()
    return require("AirCraft").new()
end)

---------------------------
--@return #boolean true if init success
function Foldder:init()
    self._score = 10
    self._alive = true
    self._model = cc.EffectSprite3D:createFromObjFileAndTexture("dijiyuanv001.c3b", "dijiyuanv001.png");
    
    if (self._model ~= nil) then
        self._model:seScale(6)
        self:addChild(self._model)
        
        self._HP = 10
        self._radius = 30
        
        return true
    end
    
    return false
end

---------------------------
--reset
function Foldder:reset()
    -- call AirCraft:reset()
    getmetatable(self):reset()
    
    self._HP = 10
    self._target = nil
end

---------------------------
--set turn rate
function Foldder:setTurnRate(turn)
    self:setMoveMode(AirCraft.moveModeTurn)
    
    self:setRotation3D({x=math.abs(turn) * 0.15, y=turn, z=0})
    
    self._turn = turn
end

---------------------------
--@return #float description
function getTurnRate()
    return self._turn
end

---------------------------
-- set move mode
function setMoveMode(moveMode)
	self._moveMode = moveMode
end

---------------------------
--@return #int get move mode
function getMoveMode()
	return self._moveMode
end

---------------------------
--move
function Foldder:move(y, dt)
    if (self._moveMode == AirCraft.moveModeTurn) then
        self:forward(y, self:getTurnRate() * dt)
    else
        self:forward(y)
    end
end

---------------------------
--shoot
function Foldder:shoot(dt)
-- TODO by zhanghh
--    if (not GameLayer.isDie and self._target:alive()) then
--        -- get angle to player
--        local selfx, selfy = self:getPosition()
--        local targetx, targety = self._target:getPosition()
--        local angle = self:getPosition()
--    end
end

return Foldder