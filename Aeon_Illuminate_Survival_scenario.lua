version = 3 -- Lua Version. Dont touch this
ScenarioInfo = {
    name = "Aeon Illuminate Survival",
    description = "The Aeon Illuminate is attacking. Defend Black Sun!!",
    preview = '',
    map_version = 6,
    AdaptiveMap = true,
    type = 'skirmish',
    starts = true,
    size = {512, 512},
    reclaim = {141816.6, 16899.51},
    map = '/maps/aeon_illuminate_survival.v0006/aeon_illuminate_survival.scmap',
    save = '/maps/aeon_illuminate_survival.v0006/aeon_illuminate_survival_save.lua',
    script = '/maps/aeon_illuminate_survival.v0006/aeon_illuminate_survival_script.lua',
    norushradius = 40,
    Configurations = {
        ['standard'] = {
            teams = {
                {
                    name = 'FFA',
                    armies = {'ARMY_1', 'ARMY_2', 'ARMY_3', 'ARMY_4', 'ARMY_5'}
                },
                {
                    name = 'FFA_1',
                    armies = {}
                },
            },
            customprops = {
                ['ExtraArmies'] = STRING( 'ARMY_SURVIVAL_ALLY ARMY_SURVIVAL_ENEMY ARMY_EMENY_BASE' ),
            },
        },
    },
}
