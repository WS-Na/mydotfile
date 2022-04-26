-- https://github.com/windwp/nvim-autopairs
local status, cursorline = pcall(require, 'nvim-cursorline')
if not status then
    vim.notify('没有找到 nvim-cursorline')
    return
end

cursorline.setup({
    cursorline = {
        enable = false,
        timeout = 350,
        number = false,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    },
})
