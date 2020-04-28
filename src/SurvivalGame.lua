-- Top level factory / state holder for the survival game

local mapPath = '/maps/aeon_illuminate_survival.v0003/'
local entropyLib
local team

local function localImport(fileName)
    return import(mapPath .. 'src/' .. fileName)
end

function getEntropyLib()
    if entropyLib == nil then
        entropyLib = import(mapPath .. 'vendor/EntropyLib/src/EntropyLib.lua').newInstance(mapPath .. 'vendor/EntropyLib/')
    end

    return entropyLib
end

function getTeam()
    if team == nil then
        team = localImport('Team.lua').newTeam(
            localImport('PlayerArmies.lua').getPresentPlayerArmies(),
            localImport('ArmyWealth.lua').calculateArmyWealth
        )
    end

    return team
end