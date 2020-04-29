function newTeam(armies, calculateArmyWealth)
    return {
        calculateWealth = function()
            local wealth = 0

            for _, name in armies do
                wealth = wealth + calculateArmyWealth(name)
            end

            return wealth
        end,
        getArmies = function()
            return armies
        end
    }
end