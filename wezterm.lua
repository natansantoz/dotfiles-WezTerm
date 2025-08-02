-- ===================================================================
-- WezTerm Configuration
-- ===================================================================
-- Terminal multiplexer configuration for WezTerm
-- Author: [Your Name]
-- Last Modified: [Date]
-- ===================================================================

local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- ===================================================================
-- UI Configuration
-- ===================================================================

config.color_scheme = "darkmatrix"

-- Disable tab bar for cleaner interface
-- Set to true if you want to use WezTerm's built-in tab management
config.enable_tab_bar = false

-- Window decorations - controls title bar and resize handles
-- Options: "NONE", "TITLE", "RESIZE", "TITLE | RESIZE"
-- "RESIZE" provides resize handles without title bar for minimal look
config.window_decorations = "RESIZE"

-- Columns (width) and rows (height) in character units
config.initial_cols = 120 -- Width
config.initial_rows = 25 -- Height

-- ===================================================================
-- Font Configuration
-- ===================================================================
-- JetBrains Mono with fallback
config.font = wezterm.font_with_fallback({
	{ family = "JetBrainsMono Nerd Font", weight = "Bold" },
	{ family = "JetBrains Mono", weight = "Bold" },
	"Symbols Nerd Font Mono",
})

-- Font size
config.font_size = 13.0

-- Font rendering options
config.freetype_load_target = "HorizontalLcd"
config.freetype_render_target = "HorizontalLcd"

-- ===================================================================
-- Transparency Configuration
-- ===================================================================
-- Window transparency (0.0 = fully transparent, 1.0 = fully opaque)
config.window_background_opacity = 0.95

-- ===================================================================
-- Performance Configuration
-- ===================================================================

config.max_fps = 240

-- ===================================================================
-- Key Bindings
-- ===================================================================

config.keys = {
	-- Copy selected text to clipboard
	-- Standard Ctrl+C for copying selected content
	{
		key = "c",
		mods = "CTRL",
		action = act.CopyTo("Clipboard"),
	},

	-- Copy selected text to primary selection (X11/Linux)
	-- Middle mouse button paste on Linux systems
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = act.CopyTo("PrimarySelection"),
	},

	-- Paste from system clipboard
	{
		key = "v",
		mods = "CTRL",
		action = act.PasteFrom("Clipboard"),
	},

	-- Paste from primary selection (X11/Linux)
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = act.PasteFrom("PrimarySelection"),
	},


	-- ============================================== Splitar tela =============================================
	-- Ctrl + \ - Divide verticalmente (lado a lado)
	-- Ctrl + -    Divide horizontalmente (cima/baixo)
	-- Ctrl + H/J/K/L - Navega entre painéis
	-- Ctrl + X - Fecha painel atual
	-- Ctrl + Z - Maximiza/restaura painel

	-- Split VERTICAL (divide lado a lado | |)
	{
		key = "\\",
		mods = "CTRL",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Split HORIZONTAL (divide em cima/embaixo ─)
	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- Navegação entre painéis (estilo Vim)
	{ key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },

	-- Fechar painel atual
	{ key = "x", mods = "CTRL", action = wezterm.action.CloseCurrentPane({ confirm = false }) },

	-- Zoom no painel (maximizar/restaurar)
	{ key = "z", mods = "CTRL", action = wezterm.action.TogglePaneZoomState },
}

-- ===================================================================
-- Export Configuration
-- ===================================================================

return config
