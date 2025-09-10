-- define your colorscheme here
local colorscheme = 'gruvbox'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

function opacity()
vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
vim.o.background = "light"
vim.api.nvim_set_hl(0,"NormalFloat",{bg = "none"})
end

opacity()
