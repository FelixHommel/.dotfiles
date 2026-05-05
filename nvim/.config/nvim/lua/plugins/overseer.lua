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

return {
    "stevearc/overseer.nvim",
    config = function()
        require("overseer").setup()

        for _, preset in ipairs(load_configure_presets()) do
            require("overseer").register_template({
                name = "CMake Configure: " .. preset.name,
                builder = function()
                    return {
                        cmd = { "cmake" },
                        args = { "--preset", preset.name }
                    }
                end
            })
        end

        for _, preset in ipairs(load_build_presets()) do
            require("overseer").register_template({
                name = "CMake Build: " .. preset.name,
                builder = function()
                    return {
                        cmd = { "cmake" },
                        args = { "--build", "--preset", preset.name }
                    }
                end
            })
        end

        for _, preset in ipairs(load_test_presets()) do
            require("overseer").register_template({
                name = "CMake Test: " .. preset.name,
                builder = function()
                    return {
                        cmd = { "ctest" },
                        args = { "--preset", preset.name }
                    }
                end
            })
        end
    end
}
