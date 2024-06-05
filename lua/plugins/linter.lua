return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function ()

        local lint = require("lint")

        lint.linters_by_ft = {
            python = { "flake8" },
            sql = { "sqlfluff" },
            java = { "checkstyle" },
            go = { "golangci-lint" },
            cpp = { "cpplint" },
        }
    end
}
