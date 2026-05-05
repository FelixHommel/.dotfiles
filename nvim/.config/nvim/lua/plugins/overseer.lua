local function load_configure_presets()
    local path = vim.fn.getcwd() .. "/CMakePresets.json"
    if vim.fn.filereadable(path) == 0 then
        return {}
    end

    local json = vim.fn.json_decode(table.concat(vim.fn.readfile(path), "\n"))
    return json.configurePresets or {}
end

local function load_build_presets()
    local path = vim.fn.getcwd() .. "/CMakePresets.json"
    if vim.fn.filereadable(path) == 0 then
        return {}
    end

    local json = vim.fn.json_decode(table.concat(vim.fn.readfile(path), "\n"))
    return json.buildPresets or {}
end

local function load_test_presets()
    local path = vim.fn.getcwd() .. "/CMakePresets.json"
    if vim.fn.filereadable(path) == 0 then
        return {}
    end

    local json = vim.fn.json_decode(table.concat(vim.fn.readfile(path), "\n"))
    return json.testPresets or {}
end

local function register_cmake_presets(opts)
    local kind = opts.kind -- "Configure" | "Build" | "Test"
    local presets = opts.presets -- list of preset objects
    local cmd = opts.cmd -- "cmake" | "ctest"
    local args_fn = opts.args_fn -- function(preset) -> args table

    for _, preset in ipairs(presets) do
        require("overseer").register_template({
            name = string.format("CMake %s: %s", kind, preset.name),
            builder = function()
                return {
                    cmd = { cmd },
                    args = args_fn(preset)
                }
            end
        })
    end
end

return {
    "stevearc/overseer.nvim",
    config = function()
        require("overseer").setup()

        register_cmake_presets({
            kind = "Configure",
            presets = load_configure_presets(),
            cmd = "cmake",
            args_fn = function (p)
                return { "--preset", p.name }
            end
        })

        register_cmake_presets({
            kind = "Build",
            presets = load_build_presets(),
            cmd = "cmake",
            args_fn = function (p)
                return { "--build", "--preset", p.name }
            end
        })

        register_cmake_presets({
            kind = "Test",
            presets = load_test_presets(),
            cmd = "ctest",
            args_fn = function (p)
                return { "--preset", p.name }
            end
        })
    end,
    keys = {
        { "<leader>ot", ":OverseerToggle<CR>", mode = "n", desc = "[o]verseer [t]oggle", noremap = true, nowait = true },
        { "<leader>or", ":OverseerRun<CR>", mode = "n", desc = "[o]verseer [r]un", noremap = true, nowait = true },
        { "<leader>oa", ":OverseerTaskAction<CR>", mode = "n", desc = "[o]verseer [a]ction", noremap = true, nowait = true }
    }
}
