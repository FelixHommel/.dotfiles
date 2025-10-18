local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    local conf = require("telescope.config").values
    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths
        }),
        previwer = conf.file_previewer({}),
        sorter = conf.generic_sorter({})
    }):find()
end

return {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function ()
        require("harpoon"):setup({ settings = { sync_on_ui_close = true } }) -- REQUIRED
        require("harpoon"):extend(require("harpoon.extensions").builtins.highlight_current_file())
    end,
    keys = {
        mode = "n",
        noremap = true,
        { "<leader>h", group = "[h]arpoon", desc = "[h]arpoon" },
        { "<leader>hl", function() toggle_telescope(require("harpoon"):list()) end, desc = "[h]arpoon [l]ist" },
        { "<leader>ha", function() require("harpoon"):list():add() end, desc = "[h]arpoon add mark" },
        { "<leader>hx", function() require("harpoon"):list():remove() end, desc = "[h]arpoon remove mark" },
        { "<leader>hn", function() require("harpoon"):list():next() end, desc = "[h]arpoon [n]ext" },
        { "<leader>hp", function() require("harpoon"):list():prev() end, desc = "[h]arpoon [p]revious" }
    }
}
