require("GameEntity")

local Plane = class("Plane", function()
    return require("GameEntity").new()
end)

function Plane:ctor()
    self.pXW = 1.1
    self.pYW = 5.0
    self.pZW = 1.0
    self.pXA = 1.0
    self.pYA = 10.0
    self.pZA = 7.0
end


function Plane:init()
    self.pRate = 3.1415926/2
    self.originX = -15.0 - 90.0
    self.originY = 159.0
    self.originZ = 9.0
    
    self._model = cc.EffectSprite3D:createFromObjFileAndTexture("playerv002.c3b", "playerv002_256.png");
    
    if (self._model ~= nil) then
        self._model:setScale(55)
        
        self._model:setRotation3D({x=self.originX, y=self.originY, z=self.originZ})
        self:setRotation3D({x=self.originX, y=self.originY, z=self.originZ})
        self:addChild(self._model)
        
        local function update(dt)
            self.pRate = self.pRate + 0.01

            self._model:setRotation3D({x=0 - self.pXA * math.sin(self.pXW * self.pRate), y=0, z=0 - self.pZA * math.sin(self.pZW * self.pRate)})
        end
        
        self:scheduleUpdateWithPriorityLua(update, 0)
    end
    return true
end

return Plane
