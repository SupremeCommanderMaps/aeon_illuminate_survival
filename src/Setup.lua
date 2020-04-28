
local function setupResourceDeposits(entropyLib, localImport)
    entropyLib.spawnAdaptiveResources(
        localImport('../Aeon_Illuminate_Survival_tables.lua')
    )
end

local function setupAutoReclaim(entropyLib)
    local percentage = ScenarioInfo.Options.opt_Survival_AutoReclaim

    if percentage > 0 then
        unitCreator.onUnitCreated(function(unit, unitInfo)
            if unitInfo.isSurvivalSpawned then
                unit.CreateWreckage = function() end
            end
        end)

        ForkThread(
            entropyLib.autoReclaimThreadFunction,
            percentage / 100,
            percentage / 100
        )
    end
end

local function setupHealthMultiplier(unitCreator)
    unitCreator.onUnitCreated(function(unit, unitInfo)
        if ScenarioInfo.Options.opt_Survival_HealthMultiplier ~= 1 and unitInfo.isSurvivalSpawned then
            unit:SetVeterancy(5)
            unit:SetMaxHealth(unit:GetMaxHealth() * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
            unit:SetHealth(unit, unit:GetMaxHealth())
        end
    end)
end

local function setupDamageMultiplier(entropyLib, unitCreator)
    local buffUnitDamage = entropyLib.newUnitBuffer().buffDamage

    unitCreator.onUnitCreated(function(unit, unitInfo)
        if unitInfo.isSurvivalSpawned then
            buffUnitDamage(unit, ScenarioInfo.Options.opt_Survival_DamageMultiplier)
        end
    end)
end

function setup(entropyLib, localImport, unitCreator)
    setupResourceDeposits(entropyLib, localImport)
    setupHealthMultiplier(unitCreator)
    setupDamageMultiplier(entropyLib, unitCreator)
    setupAutoReclaim(entropyLib)
end