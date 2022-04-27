local status, telescope = pcall(require, 'telescope')
if not status then
    vim.notify('没有找到 telescope')
    return
end

telescope.setup({
    defaults = {
        -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
        initial_mode = 'insert',
        -- 窗口内快捷键
        mappings = require('keybindings').telescopeList,
        --设置窗口大小
        layout_strategy = 'horizontal',
        layout_config = {
            width = 0.98,
            height = 0.8,
            preview_cutoff = 1,
            prompt_position = 'bottom',
        },
    },
    pickers = {
        -- 内置 pickers 配置
        find_files = {
            -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
            -- theme = 'ivy',
        },
    },
    extensions = {
        -- 扩展插件配置
        -- dash app
        ['ui-select'] = {
            require('telescope.themes').get_dropdown({
                -- even more opts
            }),
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        bookmarks = {
            -- Available: 'brave', 'buku', 'chrome', 'chrome_beta', 'edge', 'safari', 'firefox', 'vivaldi'
            selected_browser = 'chrome',

            -- Either provide a shell command to open the URL
            url_open_command = 'open',

            -- Or provide the plugin name which is already installed
            -- Available: 'vim_external', 'open_browser'
            url_open_plugin = nil,

            -- Show the full path to the bookmark instead of just the bookmark name
            full_path = false,

            -- Provide a custom profile name for Firefox
            --firefox_profile_name = nil,
        },
        maven_search = {},
        emoji = {
            -- {name="", value="", cagegory="", description=""}
        },
    },
})
require('telescope').load_extension('env')
require('telescope').load_extension('ui-select')
require('telescope').load_extension('fzf')
require('telescope').load_extension('emoji')
require('telescope').load_extension('maven_search')
require('telescope').load_extension('bookmarks')

-- not work
require('telescope').load_extension('neoclip')
