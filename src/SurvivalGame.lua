-- Top level factory / state holder for the survival game

local mapPath = '/maps/aeon_illuminate_survival.v0011/'

local entropyLib
local team
local textPrinter
local unitCreator
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

function setup()
    local setup = localImport('Setup.lua')

    setup.setupResourceDeposits(getEntropyLib(), localImport)
    setup.setupHealthMultiplier(getUnitCreator())
    setup.setupDamageMultiplier(getEntropyLib(), getUnitCreator())
    setup.setupAutoReclaim(getEntropyLib(), getUnitCreator())
    setup.setupAllFactions(newAllFactions(), getTeam())
end

function getTeam()
    if team == nil then
        team = localImport('Team.lua').newTeam(
            localImport('PlayerArmies.lua').getPresentPlayerArmies(),
            localImport('ArmyWealth.lua')
        )
    end

    return team
end

function getUnitCreator()
    if unitCreator == nil then
        unitCreator = entropyLib.newUnitCreator()
    end

    return unitCreator
end

function getTextPrinter()
    if textPrinter == nil then
        textPrinter = entropyLib.newTextPrinter()
    end

    return textPrinter
end

function getFormatter()
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

function getWaveTables()
    return localImport('WaveTables.lua').tables
end

function newAllFactions()
    return entropyLib.newAllFactions()
end

function getFoo()
    if a == nil then
        a = nil
    end

    return a
end