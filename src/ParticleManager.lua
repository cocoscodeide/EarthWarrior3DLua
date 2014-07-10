

ParticleManager=class()
ParticleManager.m_pInstance=nil
function ParticleManager:ctor()
    self.m_plistMap = {}
end

function ParticleManager:getInstance()
    if ParticleManager.m_pInstance==nil then
        ParticleManager.m_pInstance = ParticleManager.new()
        return ParticleManager.m_pInstance
    end
end

function ParticleManager:AddPlistData(strPlist,strName)

    plistData = cc.FileUtils:getInstance():getValueMapFromFile(strPlist)
    self.m_plistMap[strName] = plistData
end

function ParticleManager:GetPlistData(strplist)
    return self.m_plistMap[strplist]
end

