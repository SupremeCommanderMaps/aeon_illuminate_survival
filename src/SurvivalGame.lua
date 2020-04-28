-- Top level factory / state holder for the survival game

-- Constructor arguments:
localImport = nil
entropyLib = nil

local team

function getTeam()
    if team == nil then
        team = localImport('Team.lua').newTeam(
            localImport('PlayerArmies.lua').getPresentPlayerArmies(),
            localImport('ArmyWealth.lua').calculateArmyWealth
        )
    end

    return team
end