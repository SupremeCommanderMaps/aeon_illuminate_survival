local function isPlayerArmy(armyName, possibleNames)
    for _, name in possibleNames do
        if name == armyName then
            return true
        end
    end

    return false
end

function getPresentPlayerArmies(possiblePlayerArmyNames)
    local possibleNames = possiblePlayerArmyNames
            or {"ARMY_1", "ARMY_2", "ARMY_3", "ARMY_4", "ARMY_5", "ARMY_6", "ARMY_7", "ARMY_8" }

    local armies = {}

    for armyIndex, armyName in ListArmies() do
        if isPlayerArmy(armyName, possibleNames) then
            armies[armyIndex] = armyName
        end
    end

    return armies
end