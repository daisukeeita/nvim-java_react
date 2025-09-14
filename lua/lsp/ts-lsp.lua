local capabilities = require("cmp_nvim_lsp").default_capabilities()
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr })
	end
end

vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	init_options = {
		hostInfo = "neovim",
		preferences = {
			includeInlayParameterNameHints = "literals",
			includeInlayFunctionParameterTypeHints = true,
			includeInlayVariableTypeHints = true,
			includeInlayEnumMemberValueHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
		},
	},
	codeActionsOnSave = {
		source = {
			organizeImports = true,
			fixAll = true,
			removeUnused = true,
			addMissingImports = true,
			removeUnusedImports = true,
			sortImports = true,
		},
	},
	settings = {
		completions = {
			completeFunctionCalls = true,
		},
		implicitProjectConfiguration = {
			strictFunctionTypes = true,
			strictNullChecks = true,
		},
		typescript = {
			format = {
				indentSize = 2,
				indentStyle = "Smart",
				insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
				insertSpaceAfterKeywordsInControlFlowStatements = true,
				insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
				insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
				insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
				insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = true,
				insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
				insertSpaceAfterSemicolonInForStatements = true,
				insertSpaceAfterTypeAssertion = true,
				insertSpaceBeforeAndAfterBinaryOperators = true,
				insertSpaceBeforeFunctionParenthesis = true,
				insertSpaceBeforeTypeAnnotation = true,
				semicolons = "insert",
				tabSize = 2,
			},
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "literals",
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
				showOnAllFunctions = true,
			},
		},
	},
})

vim.lsp.enable("ts_ls")
