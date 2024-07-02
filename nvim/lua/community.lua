-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",

	-- INFO: LAUNGUAGE PACKS
	{ import = "astrocommunity.pack.lua" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.hyprlang" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.just" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.toml" },
	{ import = "astrocommunity.pack.yaml" },
	{ import = "astrocommunity.pack.bash" },

	-- INFO: CODE RUNNERS
	{ import = "astrocommunity.code-runner.executor-nvim" },
	{ import = "astrocommunity.code-runner.compiler-nvim" },

	--INFO: GIT
	{ import = "astrocommunity.git.diffview-nvim" },
	{ import = "astrocommunity.git.fugit2-nvim" },

	--INFO: INDENT
	{ import = "astrocommunity.indent.indent-rainbowline" },
}
