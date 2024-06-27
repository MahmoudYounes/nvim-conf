local builtin=require('onedark')
builtin.setup{
	style = 'cool',
	tarsparent = true,
	term_colors = true,
	toggle_style_key = '<leader>ts',
	toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'},
	code_style = {
		comments = 'italic',
	}
}

builtin.load()
