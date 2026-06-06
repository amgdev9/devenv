local harpoon = require("harpoon")
local api = require("nvim-tree.api")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
    local path

    if vim.bo.filetype == "NvimTree" then
        local node = api.tree.get_node_under_cursor()
        path = node.absolute_path
    else
        path = vim.fn.expand("%:p")
    end

    if path and path ~= "" then
        path = vim.fn.fnamemodify(path, ":.")
        item = { value = path, context = { row = 1, col = 0} }
        harpoon:list():add(item)
        vim.notify("Added to Harpoon: " .. path)
    end
end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end)

vim.keymap.set("n", "<leader><Left>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader><Right>", function() harpoon:list():next() end)

