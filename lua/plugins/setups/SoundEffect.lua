local sound_dir = "/home/adel/.config/nvim/lua/utils/sounds/Audio/"
return {
    "whleucka/reverb.nvim",
    event = "VeryLazy",
    opts = {
        player = "paplay", -- options: paplay (default), pw-play, mpv
        max_sounds = 20, -- Limit the amount of sounds that can play at the same time
        sounds = {
            -- Add custom sound paths or lists of sounds for other events here
            -- For example, BufRead can play a random sound from a list
            BufRead = { path = { sound_dir .. "maximize_008.ogg" }, volume = 100 },
            CursorMovedI = { path = sound_dir .. "click_002.ogg", volume = 100 },
            --      InsertLeave = { path = sound_dir .. "toggle.ogg", volume = 0-100 },
            ExitPre = { path = sound_dir .. "glass_004.ogg", volume = 100 },
            BufWrite = { path = sound_dir .. "drop_004.ogg", volume = 100 },
        },
    },
}
