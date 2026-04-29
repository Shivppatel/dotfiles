return {

	"mfussenegger/nvim-jdtls",
	ft = "java",
	config = function()
		local jdtls_cmd = vim.fn.exepath("jdtls")
		if jdtls_cmd == "" then
			vim.notify("jdtls not found. Install it with :MasonInstall jdtls.", vim.log.levels.WARN)
			return
		end

		local root_markers = { "gradlew", "mvnw", "pom.xml", "build.gradle", "build.gradle.kts", ".git" }
		local root_file = vim.fs.find(root_markers, { upward = true })[1]
		if not root_file then
			vim.notify("jdtls root not found for this Java buffer.", vim.log.levels.WARN)
			return
		end

		local root_dir = vim.fs.dirname(root_file)
		local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
		local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project_name

		local config = {
			cmd = { jdtls_cmd, "-data", workspace_dir },
			root_dir = root_dir,
			settings = {
				java = {
					configuration = {
						updateBuildConfiguration = "interactive",
					},
					format = {
						enabled = true,
					},
				},
			},
		}
		require("jdtls").start_or_attach(config)
	end,
}
