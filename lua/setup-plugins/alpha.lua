local startify = require("alpha.themes.startify")

startify.section.top_buttons.val = {
	startify.file_button("~/www/", "0"),
	startify.file_button("~/.config/nvim/", "1"),
	startify.file_button("~/.config/fish/", "2"),
}

require("alpha").setup(startify.opts)
