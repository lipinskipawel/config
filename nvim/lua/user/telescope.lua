local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

-- telescope.load_extension('media_files')

local actions = require("telescope.actions")

telescope.setup({
	defaults = {

		prompt_prefix = "",
		selection_caret = "",
		path_display = { "smart" },

		mappings = {
			i = {
				-- mappings for insert mode
				["<C-c>"] = actions.close,
			},

			n = {
				-- mappings for normal mode
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		find_files = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
	},
	extensions = {
		-- media_files = {
		-- filetypes whitelist
		-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
		-- filetypes = {"png", "webp", "jpg", "jpeg"},
		-- find_cmd = "rg" -- find command (defaults to `fd`)
		-- }
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})
