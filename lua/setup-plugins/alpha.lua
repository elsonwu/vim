local startify = require("alpha.themes.startify")

startify.section.top_buttons.val = {
	startify.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
	startify.file_button("~/www/", "0"),
	startify.file_button("~/.config/nvim/", "1"),
	startify.file_button("~/.config/fish/", "2"),
}

require("alpha").setup(startify.opts)
