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
-- config.color_scheme = "darkmatrix"


-- Aumentar contraste/brilho do Darkmatrix
config.colors = {
    foreground = "#5a8020",  -- Verde mais brilhante (era #3e5715)
    background = "#070c0e",   -- Mantém fundo escuro
    cursor_bg = "#c5d98e",    -- Cursor mais brilhante (era #9fa86e)
    cursor_border = "#c5d98e",
    cursor_fg = "#00ff87",    -- Mantém
    selection_bg = "#1a2b30",  -- Seleção mais visível (era #0f191c)
    selection_fg = "#00ff87",
    
    -- Cores ANSI mais brilhantes
    ansi = {
        "#0d1a1f",  -- black mais claro
        "#00854d",  -- green mais brilhante (era #006536)
        "#8fd966",  -- green claro mais brilhante (era #6fa64c)
        "#a0a600",  -- yellow mais brilhante (era #7e8000)
        "#3cc4a8",  -- cyan mais brilhante (era #2c9a84)
        "#6e4d85",  -- magenta mais brilhante (era #523a60)
        "#1a6b73",  -- cyan escuro mais brilhante (era #114d53)
        "#00854d",  -- white (green)
    },
    
    brights = {
        "#5a5a5a",  -- bright black mais claro
        "#00a352",  -- bright green mais brilhante
        "#b8ff8a",  -- bright green claro MUITO mais brilhante
        "#ffff66",  -- bright yellow MUITO mais brilhante
        "#66ffe0",  -- bright cyan MUITO mais brilhante
        "#7a5088",  -- bright magenta
        "#1a7a85",  -- bright cyan escuro
        "#00a352",  -- bright white (green)
    },
}


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
	-- Ctrl+Shift+C for copying selected content
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = act.CopyTo("Clipboard"),
	},

	-- Paste from system clipboard
	-- Ctrl+V for pasting
	{
		key = "v",
		mods = "CTRL",
		action = act.PasteFrom("Clipboard"),
	},

	-- Paste from primary selection (X11/Linux) - opcional
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
