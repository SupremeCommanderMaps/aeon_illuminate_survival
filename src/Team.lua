function newTeam(armies, armyWealth)
    return {
        calculateWealth = function()
            local wealth = 0

            for _, name in armies do
                wealth = wealth + armyWealth.calculateArmyWealth(name)
            end

            return wealth
        end,
        calculateMassIncomeFromEcoUnits = function()
            local income = 0

            for _, name in armies do
                income = income + armyWealth.calculateMassIncome(name)
            end

            return income
        end,
        getArmies = function()
            return armies
        end
    }
end