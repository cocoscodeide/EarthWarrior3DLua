

require("Cocos2d")
require("AudioEngine")

local MainMenuLayer = class("MainMenuLayer",function()
    return cc.Layer:create()
end)


---------------------------
--@return #type description
function MainMenuLayer:ctor()
	self.pRate = 0
	self.plane = nil
	self.startgame_item = nil
	self.license_item = nil
	self.credits_item = nil
    self.visibleSize = nil
end


---------------------------
--@return # description
function MainMenuLayer:init()
	
    self.pRate = math.pi/2
     
    AudioEngine.playMusic("Star_Chaser.mp3")
    cc.SpriteFrameCache:getInstance():addSpriteFrames("menu_scene.plist","menu_scene.png")
    cc.SpriteFrameCache:getInstance():addSpriteFrames("Particle.plist","Particle.png")

    visibleSize = cc.Director:getInstance():getVisibleSize()
    self.visibleSize = visibleSize
    origin = cc.Director:getInstance():getVisibleOrigin()
    winSize = cc.Director:getInstance():getWinSize()
    
    --************ adds Plane ****************
--[[
    plane =nil --Plane::create()
    self:addChild(plane, 10);
    self:scheduleUpdate();
    
    --************ adds emission flare ****************    
    flare = cc.ParticleSystemQuad:create("missileFlare.plist")
    flare:setScale(5)
    originX = -9.0
    originY = 159.0
    originZ = 9.0
    flare:setTotalParticles(50)
    flare:setRotation3D({-originX,-originY,-originZ})
    flare:setPosition(-39,0)
    flare:setPositionType(2)
    flare:setStartColor({00,0.99,1,1})
    plane:addChild(flare,-1)
    
    emis = cc.ParticleSystemQuad:create("menuEmission.plist")
    emis:setScale(3)
    emis:setRotation3D({-originX,-originY,-originZ})
    emis:setPosition(-40,0)
    emis:setPositionType(2)
    emis:setRotation(180)
    plane:addChild(emis,-2)
--]]
    --************ adds vanishing ****************
    fileUtile = cc.FileUtils:getInstance()
    --plistData = fileUtile:getValueMapFromFile("vanishingPoint.plist")
    vanishing = cc.ParticleSystemQuad:create("vanishingPoint.plist")
    vanishing:setAnchorPoint(0.5,0.5)
    vanishing:setPosition(visibleSize.width-90,visibleSize.height/2 +50)
    self:addChild(vanishing,1,1)
    
    --************* adds background ***********
    background = cc.Sprite:createWithSpriteFrameName("mainmenu_BG.png")
    background:setAnchorPoint(cc.p(0,0))
    self:addChild(background,-1,-1)
    
    --************* adds start game ***********
    local function startgame(sender)
        local function startgame_callback(node)
            AudioEngine.stopMusic();
            
        end   
        self.startgame_item:runAction(
            cc.ScaleTo:create(0.1, 1.4),
            cc.ScaleTo:create(0.1, 1.2),
            cc.ScaleTo:create(0.1, 1.3),
            cc.CallFunc:create(startgame_callback)
        )
    end
    start_normal = cc.Sprite:createWithSpriteFrameName("start_game.png")
    start_pressed = cc.Sprite:createWithSpriteFrameName("start_game.png")
    self.startgame_item = cc.MenuItemSprite:create(start_normal,start_pressed)
    self.startgame_item:registerScriptTapHandler(startgame)
    self.startgame_item:setPosition(visibleSize.width/2,200);
    self.startgame_item:setScale(1.3);
    
    --************* license *******************
    local function license(sender)
        local function license_callback(node)
            license = nil --LicenseLayer::create("credits_03.png");
            license:setAnchorPoint(cc.p(0.5,0.5))
            license:setPosition(cc.p(self.visibleSize.width/2, self.visibleSize.height/2));
            self:addChild(license,20);
            license:runAction(
                cc.Sequence:create(
                    cc.ScaleTo:create(0.2, 1.1), 
                    cc.ScaleTo:create(0.1, 0.9),
                    cc.ScaleTo:create(0.1, 1.0)
                ));
        end   
        self.credits_item:runAction(
            cc.ScaleTo:create(0.1, 0.8),
            cc.ScaleTo:create(0.1, 0.6),
            cc.ScaleTo:create(0.1, 0.7),
            cc.CallFunc:create(credits_callback)
        )
    end
    license_normal = cc.Sprite:createWithSpriteFrameName("license.png")
    license_pressed = cc.Sprite:createWithSpriteFrameName("license.png")
    self.license_item = cc.MenuItemSprite:create(license_normal,license_pressed)
    self.license_item:registerScriptTapHandler(license)
    self.license_item:setPosition(visibleSize.width/2-200,100);
    self.license_item:setScale(0.7);
    
     --************* credits *******************
    local function credits(sender)
        local function credits_callback(node)
            credit = nil --LicenseLayer::create("credits_03.png");
            credit:setAnchorPoint(cc.p(0.5,0.5))
            credit:setPosition(cc.p(self.visibleSize.width/2, self.visibleSize.height/2));
            self:addChild(credit,20);
            license:runAction(
                cc.Sequence:create(
                cc.ScaleTo:create(0.2, 1.1), 
                cc.ScaleTo:create(0.1, 0.9),
                cc.ScaleTo:create(0.1, 1.0)
            ));
        end   
        self.credits_item:runAction(
            cc.ScaleTo:create(0.1, 0.8),
            cc.ScaleTo:create(0.1, 0.6),
            cc.ScaleTo:create(0.1, 0.7),
            cc.CallFunc:create(credits_callback)
        )
    end
    credits_normal = cc.Sprite:createWithSpriteFrameName("credits.png")
    credits_pressed = cc.Sprite:createWithSpriteFrameName("credits.png")
    self.credits_item = cc.MenuItemSprite:create(credits_normal,credits_pressed)
    self.credits_item:registerScriptTapHandler(credits)
    self.credits_item:setPosition(visibleSize.width/2+200,100);
    self.credits_item:setScale(0.7);
    
    
    --************* Menu ******************
    menu = cc.Menu:create(self.startgame_item,self.license_item,self.credits_item)
    menu:setPosition(origin)
    self:addChild(menu,3)
    
    return true;
     
end


---------------------------
--@return # description
function MainMenuLayer:update(dt)
	self.pRate = self.pRate +0.01
	--self.plane:setPosition3D(Vec3(visible_size_macro.width/2+50,480-20*sin(1.05*pRate),0));
end

return MainMenuLayer