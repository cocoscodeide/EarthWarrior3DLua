require("GameEntity")
require("AudioEngine")

local AirCraft = class("AirCraft", function()
    return require("GameEntity").new()
end)

AirCraft.moveModeDefault = 1
AirCraft.moveModeTurn = 2

function AirCraft:ctor()
    self._alive = true
    self._HP = 0.0
    self._score = 0
end

---------------------------
--@return #boolean true if die
function AirCraft:hurt(damage)
    self._HP = self._HP - damage
    
    if (self._HP <= 0) then
        self:die()
    
        return true
    end
    return false
end

---------------------------
--Die
function AirCraft:die()
    self._alive = false
    
    AudioEngine.playEffect("explodeEffect.mp3")
    
    -- create effect
    
    -- TODO by zhanghh add score
    
    local helloworld = cc.Director:getInstance():getRunningScene():getChildByTag(100)
    local scale = cc.ScaleTo:create(0.1, 1.2)
    local scaleBack = cc.ScaleTo:create(0.1, 1)
    -- label:runAction(cc.Sequence:create(scale, scaleBack))
end

---------------------------
--move
function AirCraft:move(y, dt)
	self:forward(y)
end

---------------------------
--reset
function AirCraft:reset()
    self._alive = true
end

---------------------------
--@return #boolean is alive
function AirCraft:alive()
	return self._alive
end

return AirCraft
