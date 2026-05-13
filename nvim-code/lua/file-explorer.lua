local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 'f', api.tree.change_root_to_node, opts('Change Root'))
end

nvim_tree.setup({
    on_attach = on_attach,
    view = {
        width = "100%",
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})

vim.keymap.set('n', "<leader>e", function()
    api.tree.toggle({ find_file = true }) 
    if api.tree.is_visible() then
        api.tree.change_root_to_node(api.tree.get_node_under_cursor())
    end
end)

vim.keymap.set("n", "<leader>c", function()
    local path
    local node = api.tree.get_node_under_cursor()

    if vim.bo.filetype == "NvimTree" and node then
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
