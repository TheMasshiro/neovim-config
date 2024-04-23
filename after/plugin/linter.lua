require("lint").linters_by_ft = {
	python = { "ruff" },
	sql = { "sqlfluff" },
	java = { "checkstyle" },
	go = { "golangci-lint" },
	cpp = { "cpplint" },
}
