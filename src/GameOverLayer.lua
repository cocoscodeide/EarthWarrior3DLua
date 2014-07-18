require("Cocos2d")

local GameOverLayer = class("GameOverLayer", function()
    return cc.Layer:create()
end)

GameOverLayerFactory = {}

function GameOverLayerFactory:create(score)
    pRet = require("GameOverLayer").new()
    pRet.score = score   
    pRet:init()
    return pRet
end


function GameOverLayer:ctor()
    self.score = nil
    self.backtomenu_Item = nil
    self.playagain_Item = nil
end

function GameOverLayer:init()
    local function ShowScore(sender) 
        visibleSize = cc.Director:getInstance():getVisibleSize();

        score_text = cc.Sprite:createWithSpriteFrameName("gameover_score.png");
        score_text:setPosition(-200,visibleSize.height/2 + 30);
        score_text:runAction(cc.MoveTo:create(0.5, cc.p(visibleSize.width/2,visibleSize.height/2 +30)));
        self:addChild(score_text, 2);
        score_label = cc.Label:createWithBMFont("gameover_score_num.fnt", self.score);
        score_label:setAnchorPoint(0.5,0.5);
        score_label:setPosition(1000,visibleSize.height/2);
        score_label:runAction(cc.Sequence:create(   
            cc.MoveTo:create(0.5,cc.p(visibleSize.width/2,visibleSize.height/2 - 30)),
            cc.ScaleTo:create(0.1,1.3),
            cc.ScaleTo:create(0.1,0.98),
            cc.ScaleTo:create(0.1,1.2)));
        self:addChild(score_label, 2);
    end
    
    local function backtomenu(sender)
        local function backtomenu_callback(node)
            cc.SimpleAudioEngine:getInstance():stopMusic();
            MainMenuLayer = require("MainMenuScene").new()
            MainMenuLayer:init()
            MainMenuScene = cc.Scene:create()
            MainMenuScene:addChild(MainMenuLayer,1,123)
            cc.Director:getInstance():replaceScene(MainMenuScene)

            --TODO deal click back to menu, clean memory
        end   
        self.backtomenu_Item:runAction(
            cc.Sequence:create(
                cc.ScaleTo:create(0.1, 0.8),
                cc.ScaleTo:create(0.1, 0.6),
                cc.ScaleTo:create(0.1, 0.7),
                cc.CallFunc:create(backtomenu_callback))
        )
    end
    
    cc.SpriteFrameCache:getInstance():addSpriteFrames("gameover.plist", "gameover.png");
    visibleSize = cc.Director:getInstance():getVisibleSize();
    score_bk = cc.Sprite:createWithSpriteFrameName("gameover_score_bk.png");
    score_bk:setPosition(visibleSize.width/2,visibleSize.height/2);
    self:addChild(score_bk);
    score_bk:setScale(0.2);
     
    score_bk:runAction(cc.Sequence:create(cc.ScaleTo:create(0.2,1.1),
    cc.ScaleTo:create(0.1,0.9),
    cc.ScaleTo:create(0.1,1.0),
    cc.CallFunc:create(ShowScore)));
    
    

    

    
    backtomenu_normal = cc.Sprite:createWithSpriteFrameName("gameover_backtomenu.png");
    backtomenu_pressed = cc.Sprite:createWithSpriteFrameName("gameover_backtomenu.png");
    --TODO
    self.backtomenu_Item = cc.MenuItemSprite:create(backtomenu_normal,backtomenu_pressed,backtomenu_normal);
    self.backtomenu_Item:registerScriptTapHandler(backtomenu);
    self.backtomenu_Item:setScale(0.7);

    
    menu = cc.Menu:create(self.backtomenu_Item);
    menu:alignItemsHorizontallyWithPadding(20)
    menu:setPosition(visibleSize.width/2,100)
    self:addChild(menu, 2)
    
    listener = cc.EventListenerTouchOneByOne:create()
    listener:setSwallowTouches(true)

    local function onTouchBegan(touch, event)
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




return GameOverLayer
