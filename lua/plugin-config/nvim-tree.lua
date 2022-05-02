local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then
    vim.notify('没有找到 nvim-tree')
    return
end

-- 列表操作快捷键
local list_keys = require('keybindings').nvimTreeList

nvim_tree.setup({
    hijack_cursor = true,
    -- 不显示 git 状态图标
    git = {
        enable = false,
    },
    trash = {
        cmd = 'trash',
        require_confirm = true,
    },
    -- project plugin 需要这样设置
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 30,
        -- 也可以 'right'
        side = 'left',
        -- 隐藏根目录
        hide_root_folder = false,
        -- 打开第一个文件自动resize
        -- auto_resize = false,
        -- 自定义列表中快捷键
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = '╚ ',
                edge = '║ ',
                none = '  ',
            },
        },
    },
    actions = {
        use_system_clipboard = true,
        open_file = {
            -- 打开文件自动关闭nvim_tree
            quit_on_open = true,
            resize_window = true,
        },
    },

    -- npm install -g wsl-open
    -- https://github.com/4U6U57/wsl-open/
    system_open = {
        cmd = 'open',
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = '',
            info = '',
            warning = '',
            error = '🤡',
        },
    },
})
