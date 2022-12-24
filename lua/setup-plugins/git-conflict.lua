require('git-conflict').setup{
	{
		default_mappings = false, -- disable buffer local mapping created by this plugin
		default_commands = true, -- disable commands created by this plugin
		disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
	}
}
