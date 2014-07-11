require("AirCraft")
require("GameLayer")
require("AudioEngine")

local BigDude = class("BigDude", function()
    return require("AirCraft").new()
end)

---------------------------
--@return #type description
function BigDude:ctor()
	self.shootSchedulerID = nil
	self.dismissSchedulerID = nil
end

---------------------------
--@return #boolean true if init success
function BigDude:init()
    self._score = 20
    self._alive = true
    self._turnRate = 50
    
    self._model = cc.EffectSprite3D:createFromObjFileAndTexture("diji1_v002.c3b", "diji02_v002_128.png");

    if (self._model ~= nil) then
        self._model:seScale(8)
        self:addChild(self._model)

        self._type = EntityTypes.kEnemyBigDude
        self._HP = 10
        self._radius = 30

        return true
    end

    return false
end

---------------------------
--reset
function BigDude:reset()
    -- call AirCraft:reset()
    getmetatable(self):reset()

    self._HP = 30
end

---------------------------
--show finished
function BigDude:showFinished()
    -- TODO by zhanghh, continue when EnemyController done
    -- EnemyController::enemies.pushBack(this);
    -- EnemyController::showCaseEnemies.eraseObject(this);
    
    local function shoot(dt)
        if (GameLayer.isDie) then
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.shootSchedulerID)
            return;
        end
        
        -- spawn a bullet
        local offset1x, offset1y = self:getPosition()
        local offset2x, offset2y = offset1x, offset1y
        local angle = PublicApi.degreeToRadians(- self:getRotation() + 90)
        local offsetRad = PublicApi.degreeToRadians(45)
        
        offset1x = offset1x - math.cos(angle + offsetRad) * 50
        offset1y = offset1y - math.sin(angle + offsetRad) * 50
        offset2x = offset2x - math.cos(angle - offsetRad) * 50
        offset2y = offset2y - math.sin(angle - offsetRad) * 50
        
        -- TODO by zhanghh, continue when BulletController done
        
        AudioEngine.playEffect("boom.mp3")
    end
    
    self.shootSchedulerID = cc.Director:getInstance():getScheduler():scheduleScriptFunc(shoot, math.random(0, 1) * 2 + 1, false)
end

---------------------------
--update
function BigDude:update(dt, player)
    local selfx, selfy = self:getPosition()
    local playerx, playery = player:getPosition()
    
    -- TODO by zhanghh, getAngle
    local angleRad = cc.p(selfx - playerx, selfy - playery)
    local angleDeg = -PublicApi.degreeToRadians(angleRad) + 180
    
    local curRot = self:getRotation()
    
    local angleDif = math.min(math.max(angleDeg - 90 - curRot, - self._turnRate * dt), self._turnRate * dt)
    
    local f = curRot + angleDif
    self:setRotation(f)
end

---------------------------
-- show muzzle
function BigDude:showMuzzle()
    self.muzzle1 = cc.Sprite:create("muzzle.png")
    self.muzzle2 = cc.Sprite:create("muzzle.png")
    self.muzzle1:setScale(0.4)
    self.muzzle2:setScale(0.4)
    
    local offset1x, offset1y = 0, 0
    local offset2x, offset2y = offset1x, offset1y
    local angle = 90
    local offsetRad = PublicApi.degreeToRadians(45)
    offset1x = offset1x - math.cos(offsetRad + angle) * 50
    offset1y = offset1y - math.sin(offsetRad + angle) * 50
    offset2x = offset2x - math.cos(-offsetRad + angle) * 50
    offset2y = offset2y - math.sin(-offsetRad + angle) * 50
    
    self.muzzle1:setPosition(cc.p(offset1x, offset1y))
    self.muzzle2:setPosition(cc.p(offset2x, offset2y))
    
    self.muzzle1:setRotation(-35.0)
    self.muzzle2:setRotation(-35.0)
    
    self:addChild(muzzle1)
    self:addChild(muzzle2)
    
    local function dismissMuzzle(dt)
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.dismissSchedulerID)
        
        self.muzzle1:removeFromParent()
        self.muzzle2:removeFromParent()
    end
    
    self.dismissSchedulerID = cc.Director:getInstance():getScheduler():scheduleScriptFunc(shoot, math.random(0, 1) * 2 + 1, false)
end

---------------------------
-- die
function BigDude:die()
    -- TODO by zhanghh
end

---------------------------
-- fall
function BigDude:fall()
    -- TODO by zhanghh
end

return BigDude