
function setupResourceDeposits(entropyLib, localImport)
    entropyLib.spawnAdaptiveResources(
        localImport('../Aeon_Illuminate_Survival_tables.lua')
    )
end

function setupAutoReclaim(entropyLib, unitCreator)
    local percentage = ScenarioInfo.Options.opt_Survival_AutoReclaim

    if percentage > 0 then
        unitCreator.onUnitCreated(function(unit, unitInfo)
            if unitInfo.isSurvivalSpawned then
                unit.CreateWreckage = function() end
            end
        end)

        ForkThread(
            entropyLib.autoReclaimThreadFunction(),
            percentage / 100,
            percentage / 100
        )
    end
end

function setupHealthMultiplier(unitCreator)
    unitCreator.onUnitCreated(function(unit, unitInfo)
        if ScenarioInfo.Options.opt_Survival_HealthMultiplier ~= 1 and unitInfo.isSurvivalSpawned then
            unit:SetVeterancy(5)
            unit:SetMaxHealth(unit:GetMaxHealth() * ScenarioInfo.Options.opt_Survival_HealthMultiplier)
            unit:SetHealth(unit, unit:GetMaxHealth())
        end
    end)
end

function setupDamageMultiplier(entropyLib, unitCreator)
    local buffUnitDamage = entropyLib.newUnitBuffer().buffDamage

    unitCreator.onUnitCreated(function(unit, unitInfo)
        if unitInfo.isSurvivalSpawned then
            buffUnitDamage(unit, ScenarioInfo.Options.opt_Survival_DamageMultiplier)
        end
    end)
end

function setupAllFactions(allFactions, team)
    if ScenarioInfo.Options.opt_SurvivalAllFactions ~= 0 then
        for armyIndex in team.getArmies() do
            if ScenarioInfo.Options.opt_SurvivalAllFactions == 1 then
                allFactions.spawnExtraEngineers(ArmyBrains[armyIndex])
            else
                allFactions.spawnExtraAcus(ArmyBrains[armyIndex])
            end
        end
    end
end
