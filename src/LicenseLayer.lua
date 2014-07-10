require("cocos2d")

local LicenseLayer = class("LicenseLayer", function()
    return cc.Layer:create()
end)

LicenseLayerFactory = {}

function LicenseLayerFactory:create(type_file_name)
    pRet = require("LicenseLayer").new()
    pRet.type_file_name = type_file_name   
    pRet:init()
    return pRet
end


function LicenseLayer:ctor()
    self.license = nil
    self.type_file_name = nil
end

function LicenseLayer:init()
    window = cc.Sprite:create(self.type_file_name)
    self:addChild(window,1)
    window:setScaleX(0.2)
    actions = cc.Sequence:create(cc.ScaleTo:create(0.2,1.1),cc.ScaleTo:create(0.1,0.9),cc.ScaleTo:create(0.1,1.0))
    window:runAction(actions)
    listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)
    
    local function onTouchBegan(touch, event)
        actions = cc.Sequence:create(cc.ScaleTo:create(0.2,0.2), cc.CallFunc:create(self.dismiss))
        self:runAction(actions)
        return true;
    end
    
    local function onTouchMoved(touch, event)

    end

    local function onTouchEnded(touch, event)

    end

    listener:registerScriptHandler(onTouchBegan, cc.Handler.EVENT_TOUCH_BEGAN)
    listener:registerScriptHandler(onTouchMoved, cc.Handler.EVENT_TOUCH_MOVED)
    listener:registerScriptHandler(onTouchEnded, cc.Handler.EVENT_TOUCH_ENDED)
    self:getEventDispatcher():addEventListenerWithSceneGraphPriority(listener, self)
end

function LicenseLayer:dismiss()
    self:removeFromParent();
end



return LicenseLayer
