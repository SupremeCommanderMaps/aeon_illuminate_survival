

local function getUnitsOfArmyName(armyName)
    local armyBrain = GetArmyBrain(armyName)

    if armyBrain == nil then
        return {}
    end

    local CAN_BE_IDLE = true
    local NEEDS_TO_BE_BUILD = true

    -- categories.ECONOMIC + categories.COMMAND (misses SACUs)
    return armyBrain:GetListOfUnits(categories.ALLUNITS, CAN_BE_IDLE, NEEDS_TO_BE_BUILD)
end

local function getUnitWealth(unit)
    --return unit:GetBlueprint().Economy.BuildCostMass

    if unit:IsBeingBuilt() then
        return 0
    end

    return unit:GetProductionPerSecondMass()
end

function calculateArmyWealth(armyName)
    local wealth = 0

    for _, unit in getUnitsOfArmyName(armyName) do
        wealth = wealth + getUnitWealth(unit)
    end

    return wealth
end
