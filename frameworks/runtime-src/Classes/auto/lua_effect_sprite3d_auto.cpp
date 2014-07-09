#include "lua_effect_sprite3d_auto.hpp"
#include "Sprite3DEffect.h"
#include "tolua_fix.h"
#include "LuaBasicConversions.h"



int lua_effect_sprite3d_EffectSprite3D_setEffect3D(lua_State* tolua_S)
{
    int argc = 0;
    EffectSprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"EffectSprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (EffectSprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_effect_sprite3d_EffectSprite3D_setEffect3D'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        Effect3D* arg0;

        ok &= luaval_to_object<Effect3D>(tolua_S, 2, "Effect3D",&arg0);
        if(!ok)
            return 0;
        cobj->setEffect3D(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "setEffect3D",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_effect_sprite3d_EffectSprite3D_setEffect3D'.",&tolua_err);
#endif

    return 0;
}
int lua_effect_sprite3d_EffectSprite3D_getEffectCount(lua_State* tolua_S)
{
    int argc = 0;
    EffectSprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"EffectSprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (EffectSprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_effect_sprite3d_EffectSprite3D_getEffectCount'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        ssize_t ret = cobj->getEffectCount();
        tolua_pushnumber(tolua_S,(lua_Number)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "getEffectCount",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_effect_sprite3d_EffectSprite3D_getEffectCount'.",&tolua_err);
#endif

    return 0;
}
int lua_effect_sprite3d_EffectSprite3D_addEffect(lua_State* tolua_S)
{
    int argc = 0;
    EffectSprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"EffectSprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (EffectSprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_effect_sprite3d_EffectSprite3D_addEffect'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 2) 
    {
        Effect3D* arg0;
        ssize_t arg1;

        ok &= luaval_to_object<Effect3D>(tolua_S, 2, "Effect3D",&arg0);

        ok &= luaval_to_ssize(tolua_S, 3, &arg1);
        if(!ok)
            return 0;
        cobj->addEffect(arg0, arg1);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "addEffect",argc, 2);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_effect_sprite3d_EffectSprite3D_addEffect'.",&tolua_err);
#endif

    return 0;
}
int lua_effect_sprite3d_EffectSprite3D_getEffect(lua_State* tolua_S)
{
    int argc = 0;
    EffectSprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"EffectSprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (EffectSprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_effect_sprite3d_EffectSprite3D_getEffect'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        ssize_t arg0;

        ok &= luaval_to_ssize(tolua_S, 2, &arg0);
        if(!ok)
            return 0;
        Effect3D* ret = cobj->getEffect(arg0);
        object_to_luaval<Effect3D>(tolua_S, "Effect3D",(Effect3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "getEffect",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_effect_sprite3d_EffectSprite3D_getEffect'.",&tolua_err);
#endif

    return 0;
}
int lua_effect_sprite3d_EffectSprite3D_eraseEffect(lua_State* tolua_S)
{
    int argc = 0;
    EffectSprite3D* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"EffectSprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (EffectSprite3D*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_effect_sprite3d_EffectSprite3D_eraseEffect'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 1) 
    {
        Effect3D* arg0;

        ok &= luaval_to_object<Effect3D>(tolua_S, 2, "Effect3D",&arg0);
        if(!ok)
            return 0;
        cobj->eraseEffect(arg0);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "eraseEffect",argc, 1);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_effect_sprite3d_EffectSprite3D_eraseEffect'.",&tolua_err);
#endif

    return 0;
}
int lua_effect_sprite3d_EffectSprite3D_createFromObjFileAndTexture(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"EffectSprite3D",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 2)
    {
        std::string arg0;
        std::string arg1;
        ok &= luaval_to_std_string(tolua_S, 2,&arg0);
        ok &= luaval_to_std_string(tolua_S, 3,&arg1);
        if(!ok)
            return 0;
        EffectSprite3D* ret = EffectSprite3D::createFromObjFileAndTexture(arg0, arg1);
        object_to_luaval<EffectSprite3D>(tolua_S, "EffectSprite3D",(EffectSprite3D*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "createFromObjFileAndTexture",argc, 2);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_effect_sprite3d_EffectSprite3D_createFromObjFileAndTexture'.",&tolua_err);
#endif
    return 0;
}
static int lua_effect_sprite3d_EffectSprite3D_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (EffectSprite3D)");
    return 0;
}

int lua_register_effect_sprite3d_EffectSprite3D(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"EffectSprite3D");
    tolua_cclass(tolua_S,"EffectSprite3D","EffectSprite3D","cc.Sprite3D",nullptr);

    tolua_beginmodule(tolua_S,"EffectSprite3D");
        tolua_function(tolua_S,"setEffect3D",lua_effect_sprite3d_EffectSprite3D_setEffect3D);
        tolua_function(tolua_S,"getEffectCount",lua_effect_sprite3d_EffectSprite3D_getEffectCount);
        tolua_function(tolua_S,"addEffect",lua_effect_sprite3d_EffectSprite3D_addEffect);
        tolua_function(tolua_S,"getEffect",lua_effect_sprite3d_EffectSprite3D_getEffect);
        tolua_function(tolua_S,"eraseEffect",lua_effect_sprite3d_EffectSprite3D_eraseEffect);
        tolua_function(tolua_S,"createFromObjFileAndTexture", lua_effect_sprite3d_EffectSprite3D_createFromObjFileAndTexture);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(EffectSprite3D).name();
    g_luaType[typeName] = "EffectSprite3D";
    g_typeCast["EffectSprite3D"] = "EffectSprite3D";
    return 1;
}
TOLUA_API int register_all_effect_sprite3d(lua_State* tolua_S)
{
	tolua_open(tolua_S);
	
	tolua_module(tolua_S,"cc",0);
	tolua_beginmodule(tolua_S,"cc");

	lua_register_effect_sprite3d_EffectSprite3D(tolua_S);

	tolua_endmodule(tolua_S);
	return 1;
}

