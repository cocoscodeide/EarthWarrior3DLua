require("Foldder")

local FoldderLeader = class("FoldderLeader", function()
    return require("Foldder").new()
end)

---------------------------
--@return #boolean true if init success
function FoldderLeader:init()
    self._score = 20
    self._alive = true
    self._model = cc.EffectSprite3D:createFromObjFileAndTexture("dijiyuanv001.c3b", "dijiyuanv001.png");

    if (self._model ~= nil) then
        self._model:seScale(8)
        self:addChild(self._model)

        self._type = EntityTypes.kEnemyFodderL
        self._HP = 20
        self._radius = 35

        return true
    end

    return false
end

---------------------------
--reset
function FoldderLeader:reset()
    -- call AirCraft:reset()
    getmetatable(getmetatable(self)):reset()

    self._HP = 20
end

return FoldderLeader