require "Cocos2d"
require "Cocos2dConstants"

-- cclog
cclog = function(...)
    print(string.format(...))
end

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
    return msg
end

local testnode = class("tooltest",function()
    return cc.Node:create()
end)

local function main()
    collectgarbage("collect")
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)
    cc.Director:getInstance():getOpenGLView():setDesignResolutionSize(640, 960, 0)
	cc.FileUtils:getInstance():addSearchPath("src");
    cc.FileUtils:getInstance():addSearchPath("res");

    
    MainMenuLayer = require("MainMenuScene").new()
    MainMenuLayer:init()
    MainMenuScene = cc.Scene:create()
    MainMenuScene:addChild(MainMenuLayer,1,123)
    if cc.Director:getInstance():getRunningScene() then
        cc.Director:getInstance():replaceScene(MainMenuScene)
    else
        cc.Director:getInstance():runWithScene(MainMenuScene)
    end
    
end


local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    error(msg)
end
