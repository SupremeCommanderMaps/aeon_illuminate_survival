newInstance = function(textPrinter, formatter, options, mapVersion)
    local WELCOME_MESSAGE_DURATION = 23
    local headerOptions = { color = "ff5599ff", duration = WELCOME_MESSAGE_DURATION, location = "leftcenter" }
    local titleOptions = { color = "ff5599ff", duration = WELCOME_MESSAGE_DURATION, location = "leftcenter", size = 35 }
    local textOptions = { color = "ff4488df", duration = WELCOME_MESSAGE_DURATION, location = "leftcenter" }

    local function displaySettings()
        textPrinter.print(string.rep(" ", 20) .. "Enemy count " .. options.opt_Survival_EnemiesPerMinute, textOptions)
        textPrinter.print(string.rep(" ", 20) .. "Enemy health " .. formatter.formatMultiplier(options.opt_Survival_HealthMultiplier), textOptions)
        textPrinter.print(string.rep(" ", 20) .. "Enemy damage " .. formatter.formatMultiplier(options.opt_Survival_DamageMultiplier), textOptions)
        textPrinter.print(string.rep(" ", 20) .. "Enemies spawn " .. formatter.inTimeString(options.opt_Survival_BuildTime), textOptions)
        textPrinter.print(string.rep(" ", 20) .. "Enemies spawn every " .. formatter.formatTime(options.opt_Survival_WaveFrequency), textOptions)

        textPrinter.print(
            string.rep(" ", 20) .. "Auto reclaim: " ..
                (
                    options.opt_Survival_AutoReclaim == 0
                        and "off"
                        or (options.opt_Survival_AutoReclaim .. "%")
                ),
            textOptions
        )
    end

    local function displayWelcome()
        textPrinter.print(string.rep(" ", 20) .. "Welcome to", headerOptions)
        textPrinter.print(string.rep(" ", 12) .. "Aeon Illuminate Survival", titleOptions)
        textPrinter.print(string.rep(" ", 66) .. "Version " .. mapVersion, headerOptions)

        textPrinter.printBlankLine(textOptions)
        textPrinter.printBlankLine(textOptions)

        displaySettings()
    end

    return {
        startDisplay = function()
            ForkThread(function()
                displayWelcome()
            end)
        end,
        displaySettings = displaySettings
    }
end