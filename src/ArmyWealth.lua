

local function getUnitsOfArmyName(armyName)
    local CAN_BE_IDLE = true
    local armyBrain = GetArmyBrain(armyName)

    if armyBrain == nil then
        return {}
    end

    return armyBrain:GetListOfUnits(categories.ALLUNITS, CAN_BE_IDLE)
end

local function getUnitWealth(unit)
    return unit:GetBlueprint().Economy.BuildCostMass
end

function calculateArmyWealth(armyName)
    local wealth = 0

    for _, unit in getUnitsOfArmyName(armyName) do
        wealth = wealth + getUnitWealth(unit)
    end

    return wealth
end
