local PublicApi = class()

---------------------------
--@return #float radians for angle
function PublicApi.degreeToRadians(angle)
    return angle * 0.01745329252
end

---------------------------
--@return #float angle for radians
function PublicApi.radiansToDegree(radians)
    return radians * 57.29577951
end

return PublicApi