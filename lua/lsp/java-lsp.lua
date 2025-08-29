local jdtls = require("jdtls")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local home = os.getenv("HOME")

local jdtls_path = home .. "/.local/share/jdtls"
local launcher = vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local config = jdtls_path .. "/config_linux"

local lombok_path = home .. "/.local/share/lombok/lombok.jar"

local javadebug_path = home .. "/.local/share/java-debug"
local javatest_path = home .. "/.local/share/vscode-java-test"
local bundles = {
	vim.fn.glob(
		javadebug_path .. "/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
		true
	),
}
vim.list_extend(bundles, vim.fn.glob(javatest_path .. "/server/*.jar", true, true))

local workspace_dir = home .. "/.cache/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local extended_capabilities = jdtls.extendedClientCapabilities
extended_capabilities.resolveAdditionalTextEditsSupport = true
extended_capabilities.progressReportProvider = false

local config_opt = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-javaagent:" .. lombok_path,
		"-jar",
		launcher,
		"-configuration",
		config,
		"-data",
		workspace_dir,
	},
	capabilities = capabilities,
	root_dir = jdtls.setup.find_root({ "gradlew", "mvnw", ".git", "pom.xml" }),
	settings = {
		java = {
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = true,
			},
			maven = {
				downloadSources = true,
			},
			implementationCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			inlayHints = {
				parameterNames = {
					enabled = "all",
				},
			},
			project = {
				referencedLibraries = {
					lombok_path,
				},
			},
			compilation = {
				annotationProcessing = {
					enabled = true,
				},
			},
			format = {
				enabled = true,
				settings = {
					url = home .. "/.local/share/formatters/eclipse-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},
			saveActions = {
				organizeImports = true,
			},
			signatureHelp = {
				enabled = true,
			},
			contentProvider = { preferred = "fernflower" },
			completion = {
				favoriteStaticMembers = {
					"org.hamcrest.MatcherAssert.assertThat",
					"org.hamcrest.Matchers.*",
					"org.hamcrest.CoreMatchers.*",
					"org.junit.jupiter.api.Assertions.*",
					"java.util.Objects.requireNonNull",
					"java.util.Objects.requireNonNullElse",
					"org.mockito.Mockito.*",
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				generateComments = true,
				toString = {
					template = "${object.className} {\n\t"
						.. "${member.name()}: ${member.value},\n\t"
						.. "${otherMembers}\n"
						.. "}",
				},
				useBlocks = true,
			},
		},
	},
	init_options = {
		-- jvm_args = "-javaagent:" .. lombok_path,
		bundles = bundles,
		extendedClientCapabilities = extended_capabilities,
	},
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "java",
	callback = function()
		print("Java FileType Detected.")
		require("jdtls").start_or_attach(config_opt)
	end,
})
