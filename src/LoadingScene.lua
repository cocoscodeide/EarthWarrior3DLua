require("Cocos2d")
require("AudioEngine")
require("consts")

local LoadingScene = class("LoadingScene",function()
    return cc.Layer:create()
end)

LoadingScene.updatecount = 0
LoadingScene.m_curPreload_fodder_count = 0
LoadingScene.m_curPreload_fodderL_count = 0
LoadingScene.m_curPreload_BigDude_count = 0
LoadingScene.m_curPreload_Missile_count = 0
LoadingScene.m_curPreload_Boss_count = 0
LoadingScene.audioloaded = false
LoadingScene.particleloaded = false

LoadingScene.TOTAL_PIC_NUM = 13
LoadingScene.PRELOAD_FODDER_COUNT = 18
LoadingScene.PRELOAD_FODDERL_COUNT = 3
LoadingScene.PRELOAD_BIGDUDE_COUBR = 5
LoadingScene.PRELOAD_MISSILE_COUNT = 5
LoadingScene.PRElOAD_BOSS_COUNT = 1

---------------------------
--@return #type description
function LoadingScene:ctor()
    self.currentNum = 0
    self.totalNum = LoadingScene.TOTAL_PIC_NUM
    self.m_pProgress = nil
    self.m_pPercent = nil
end

function LoadingScene.createScene()

    scene = cc.Scene:create()
    loadingLayer = LoadingScene.new()
    loadingLayer:init()
    scene:addChild(loadingLayer);
    return scene;
end


function LoadingScene:init()
    self:InitBk()
    self:InitCoco() 
    self:LoadingResource()
    
    function update(dt)
        LoadingScene.updatecount = LoadingScene.updatecount+1
        if LoadingScene.m_curPreload_fodder_count < LoadingScene.PRELOAD_FODDER_COUNT then

            self:LoadingEnemy(EntityTypes.kEnemyFodder)
            LoadingScene.m_curPreload_fodder_count = LoadingScene.m_curPreload_fodder_count+1

        elseif LoadingScene.m_curPreload_fodderL_count < LoadingScene.PRELOAD_FODDERL_COUNT then

            self:LoadingEnemy(EntityTypes.kEnemyFodderL)
            LoadingScene.m_curPreload_fodderL_count = LoadingScene.m_curPreload_fodderL_count+1

        elseif LoadingScene.m_curPreload_BigDude_count < LoadingScene.PRELOAD_BIGDUDE_COUBR then

            self:LoadingEnemy(EntityTypes.kEnemyBigDude)
            LoadingScene.m_curPreload_BigDude_count = LoadingScene.m_curPreload_BigDude_count + 1

        elseif LoadingScene.m_curPreload_Missile_count < LoadingScene.PRELOAD_MISSILE_COUNT then

            self:LoadingBullet(EntityTypes.kPlayerMissiles)
            LoadingScene.m_curPreload_Missile_count = LoadingScene.m_curPreload_Missile_count + 1

        elseif LoadingScene.m_curPreload_Boss_count < LoadingScene.PRElOAD_BOSS_COUNT then
            self:LoadingEnemy(EntityTypes.kEnemyBoss)
            LoadingScene.m_curPreload_Boss_count = LoadingScene.m_curPreload_Boss_count+1
        else
            self:unscheduleUpdate()
        end
    end
    
    self:scheduleUpdateWithPriorityLua(update, 0)
end

function LoadingScene:InitBk()
    visibleSize = cc.Director:getInstance():getVisibleSize()
    cc.SpriteFrameCache:getInstance():addSpriteFrames("loadingAndHP.plist","loadingAndHP.png")
    
    loading_bk = cc.Sprite:createWithSpriteFrameName("loading_bk.png")
    loading_bk:setPosition(visibleSize.width/2,visibleSize.height/2)
    self:addChild(loading_bk,0)
    
    self.m_pPercent = cc.Label:createWithBMFont("num.fnt","0%")
    self.m_pPercent:setPosition(cc.p(visibleSize.width/2,visibleSize.height/2+170))
    self:addChild(self.m_pPercent,1)
    
    progress_bk = cc.Sprite:createWithSpriteFrameName("loading_progress_bk.png")
    progress_bk:setPosition(visibleSize.width/2,visibleSize.height/2+300)
    self:addChild(progress_bk)
    
    self.m_pProgress = cc.Sprite:createWithSpriteFrameName("loading_progress_thumb.png")
    self.m_pProgress:setPosition(100,visibleSize.height/2+320)
    self:addChild(self.m_pProgress)        
end


function LoadingScene:InitCoco()
    
    visibleSize = cc.Director:getInstance():getVisibleSize()
    coco = cc.EffectSprite3D:createFromObjFileAndTexture("coconut.c3b", "coco.png")
    if coco then
    	coco:setRotation3D({90,0,180})
        coco:setPosition(visibleSize.width/2, visibleSize.height/2-150)
        self:addChild(coco,1)
        coco:runAction(cc.RepeatForever:create(cc.RotateBy:create(0.8,{0,360,0})))
    end
end



function LoadingScene:LoadingResource()

    if LoadingScene.particleloaded then
        self:LoadingParticle()
    end
     
    if LoadingScene.audioloaded then
        self:LoadingMusic()
    end
    self:LoadingPic()
end


function LoadingScene:LoadingMusic()
    LoadingScene.audioloaded = true;
    AudioEngine.preloadEffect("explodeEffect.mp3");
    AudioEngine.preloadEffect("hit.mp3");
    AudioEngine.preloadEffect("boom2.mp3");
    AudioEngine.preloadEffect("boom.mp3");
    AudioEngine.preloadMusic("Orbital Colossus_0.mp3");
    AudioEngine.playMusic("Flux2.mp3");
end


---------------------------
--@return #type description
function LoadingScene:LoadingPic()
    local function imageLoaded(pObj)
        self.currentNum = self.currentNum +1
        tem = string.format("%d%%",(self.currentNum*100)/self.totalNum)
        self.m_pPercent:setString(tem)
        self.m_pProgress:runAction(cc.MoveBy:create(0.01, cc.p(420/LoadingScene.TOTAL_PIC_NUM,0)))
        if self.currentNum == self.totalNum  then
        	self:GotoNextScene()
        end
    end
	texureCache = cc.Director:getInstance():getTextureCache()
    texureCache:addImageAsync("boss.png", imageLoaded)
    texureCache:addImageAsync("coco.png", imageLoaded)
    texureCache:addImageAsync("groundLevel.jpg", imageLoaded)
    texureCache:addImageAsync("bullets.png", imageLoaded)
    texureCache:addImageAsync("daodan_32.png", imageLoaded)
    texureCache:addImageAsync("diji02_v002_128.png", imageLoaded)
    texureCache:addImageAsync("dijiyuanv001.png", imageLoaded)
    texureCache:addImageAsync("playerv002_256.png", imageLoaded)
    texureCache:addImageAsync("streak.png", imageLoaded)
    texureCache:addImageAsync("gameover_score_num_0.png", imageLoaded)
    texureCache:addImageAsync("num_0.png", imageLoaded)
    texureCache:addImageAsync("score_right_top.png", imageLoaded)
    texureCache:addImageAsync("gameover.png", imageLoaded)
    
end


function LoadingScene:GotoNextScene()
    cc.SpriteFrameCache:getInstance():addSpriteFrames("gameover.plist","gameover.png")
    local schedulerID =0
    local function RunNextScene()
        cc.Director:getInstance():getScheduler():unscheduleScriptEntry(schedulerID)
        self:removeAllChildren()
        GameScene =nil --HelloWorld::createScene();
        cc.Director:getInstance():replaceScene(cc.TransitionZoomFlipX:create(1.0,GameScene))
    end
    schedulerID = cc.Director:getInstance():getScheduler():scheduleScriptFunc(RunNextScene, 1.0, false)
end

function LoadingScene:LoadingEnemy(enemytype)
    if enemytype == EntityTypes.kEnemyFodder  then
    
    elseif enemytype == EntityTypes.kEnemyFodderL then
    
    elseif enemytype == EntityTypes.kEnemyBigDude then
    
    elseif enemytype == EntityTypes.kEnemyBoss then
    
    end
    
end

function LoadingScene:LoadingBullet(enemytype)
    if enemytype == EntityTypes.kPlayerMissiles  then
    end
end


function LoadingScene:LoadingParticle()

    LoadingScene.particleloaded = true
    require("ParticleManager")
    particle=ParticleManager.getInstance()
    particle:AddPlistData("missileFlare.plist","missileFlare")
    particle:AddPlistData("emission.plist", "emission")
    particle:AddPlistData("missileFlare.plist","missileFlare")
    particle:AddPlistData("toonSmoke.plist", "toonSmoke")
    particle:AddPlistData("flare.plist", "flare")
    particle:AddPlistData("glow.plist", "glow")
    particle:AddPlistData("debris.plist", "debris")
    particle:AddPlistData("emissionPart.plist", "emissionPart")
    particle:AddPlistData("engine.plist", "engine")

end

return LoadingScene
