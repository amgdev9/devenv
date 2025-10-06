local minidiff = require("mini.diff")
minidiff.setup()

vim.keymap.set("n", "<leader>d", function()
    minidiff.toggle_overlay()
end)

