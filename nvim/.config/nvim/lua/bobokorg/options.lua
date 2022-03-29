-- Helpers --
local cmd = vim.cmd
local opt = vim.opt

-- Options --
local options = {
	relativenumber = true,
    fileencoding = "utf-8",
	number = true,
	hlsearch = true, 
	errorbells = false, 
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	smartindent = true,
	wrap = false,
	swapfile = false,
	backup = false,
	undofile = true,
	incsearch = true,
	scrolloff = 8,
	signcolumn= "yes",
	colorcolumn = "80",
    completeopt ={ "menuone", "noinsert", "noselect" },
    splitright = true,
    splitbelow = true,
}

opt.shortmess:append "c"

for k, v in pairs(options) do
    opt[k] = v
end

cmd "set whichwrap+=<,>,[,],h,l"
cmd [[set iskeyword+=-]]
