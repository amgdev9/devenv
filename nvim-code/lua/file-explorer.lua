local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local function change_root_silently(api_func)
        return function()
            local cwd = vim.fn.getcwd()
            api_func()
            vim.fn.chdir(cwd)
        end
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 'f', change_root_silently(api.tree.change_root_to_node), opts('Change Root'))
    vim.keymap.set('n', '-', change_root_silently(api.tree.change_root_to_parent), opts('Up'))
end

nvim_tree.setup({
    on_attach = on_attach,
    sync_root_with_cwd = false,
    view = {
        width = "100%",
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    git = {
        enable = false,
    },
})

vim.keymap.set('n', "<leader>e", function()
    local path = nil
    if not api.tree.is_visible() then
        path = vim.fn.expand("%:p:h") 
    end
    api.tree.toggle({ path = path, current_window = true }) 
end)

vim.keymap.set("n", "<leader>c", function()
    local path

    if vim.bo.filetype == "NvimTree" then
        local node = api.tree.get_node_under_cursor()
        path = node.absolute_path
    else
        path = vim.fn.expand("%:p")
    end

    if path and path ~= "" then
        path = vim.fn.fnamemodify(path, ":.")
        vim.fn.setreg("+", path)
        vim.notify("Copied: " .. path)
    end
end, { desc = "Copy relative path" })
