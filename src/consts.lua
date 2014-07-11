
function CreatEnumTable(tbl, index) 
    local enumtbl = {} 
    local enumindex = index or 0 
    for i, v in ipairs(tbl) do 
        enumtbl[v] = enumindex + i 
    end 
    return enumtbl 
end 

EntityTypes =
{
    "kPlayerBullet",
    "kPlayerMissiles",
    "kEnemyBullet",
    "kPlayer",
    "kEnemy",
    "kEnemyFodder",
    "kEnemyFodderL",
    "kEnemyBigDude",
    "kEnemyBoss"
}

EntityTypes = CreatEnumTable(EntityTypes)

PLAYER_LIMIT_LEFT = -240
PLAYER_LIMIT_RIGHT = 240
PLAYER_LIMIT_TOP = 737
PLAYER_LIMIT_BOT = -376

BOUND_RECT = cc.rect(-380,PLAYER_LIMIT_BOT-60,760,PLAYER_LIMIT_TOP-PLAYER_LIMIT_BOT+180)
ENEMY_BOUND_RECT = cc.rect(-480,PLAYER_LIMIT_BOT-60,960,PLAYER_LIMIT_TOP-PLAYER_LIMIT_BOT+380)


