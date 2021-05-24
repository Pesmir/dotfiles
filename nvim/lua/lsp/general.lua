-- python
local python_arguments = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local flake8 = {
    LintCommand = "flake8 --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"}
}
local isort = {formatCommand = "isort --quiet --profile='black' -", formatStdin = true}
local black = {formatCommand = "black --quiet -", formatStdin = true}

table.insert(python_arguments, flake8)
table.insert(python_arguments, isort)
table.insert(python_arguments, black)

-- sh
local sh_arguments = {}
local shfmt = {formatCommand = 'shfmt -ci -s -bn', formatStdin = true}

local shellcheck = {
    LintCommand = 'shellcheck -f gcc -x',
    lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}
table.insert(sh_arguments, shfmt)
table.insert(sh_arguments, shellcheck)

-- tsserver/web javascript react, vue, json, html, css, yaml
local prettier = {formatCommand = "prettier --stdin-filepath ${INPUT}", formatStdin = true}
local tsserver_args = {}
table.insert(tsserver_args, prettier)

local markdownPandocFormat = {formatCommand = 'pandoc -f markdown -t gfm -sp --tab-stop=2', formatStdin = true}

require"lspconfig".efm.setup {
    -- init_options = {initializationOptions},
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"python", "sh", "json", "yaml", "markdown"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            python = python_arguments,
            sh = sh_arguments,
            json = {prettier},
            yaml = {prettier},
        }
    },
    capabilities = capabilities
}
