-- Top level factory / state holder for the survival game

local mapPath = '/maps/aeon_illuminate_survival.v0003/'

local entropyLib
local team
local textPrinter
local formatter
local welcomeMessages

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

function getTextPrinter()
    if textPrinter == nil then
        textPrinter = entropyLib.newTextPrinter()
    end

    return textPrinter
end

local function getFormatter()
    if formatter == nil then
        formatter = entropyLib.newFormatter()
    end

    return formatter
end

function getWelcomeMessages()
    if welcomeMessages == nil then
        welcomeMessages = localImport('WelcomeMessages.lua').newInstance(
            getTextPrinter(),
            getFormatter(),
            ScenarioInfo.Options,
            ScenarioInfo.map_version
        )
    end

    return welcomeMessages
end

function getFoo()
    if a == nil then
        a = nil
    end

    return a
end