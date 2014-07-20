require("Cocos2d")

local EffectSprite3D = class("EffectSprite3D", function()
    return cc.Sprite3D:create()
end)

function EffectSprite3D:init(objFilePath, textureFilePath)
    self:initWithFile(objFilePath)
    self:setTexture(textureFilePath)
end

return EffectSprite3D
