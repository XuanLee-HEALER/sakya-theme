-- Sakya Dorje — Neovim colorscheme
-- Inspired by Tibetan thangka mineral pigments and Five Buddha colors
-- "Light emerges from emptiness" (Nag-thang tradition)

local M = {}

-- ── Palette ──────────────────────────────────────────────

local c = {
  -- Background hierarchy (deep → shallow)
  shunyata  = "#0C0C14", -- 空 · Emptiness / deepest void
  drak      = "#13131F", -- 岩 · Stone / sidebar
  sa        = "#1B1B2A", -- 土 · Earth / main editor bg
  surface0  = "#262638", -- 面〇 · Cards, inputs
  surface1  = "#36364A", -- 面一 · Floating panels, selections
  surface2  = "#46465C", -- 面二 · Higher layers

  -- Foreground hierarchy (bright → dim)
  karpo     = "#E8E0D4", -- 白 · Primary text (Lead White)
  drimed    = "#C4BCAE", -- 无垢 · Secondary text
  dulba     = "#9E978C", -- 柔 · Tertiary / line numbers
  disabled  = "#686882", -- 寂 · Disabled text

  -- Accent colors (Five Buddha pigments)
  gser      = "#D2B450", -- 金 · Gold — keywords, cursor
  ngonpo    = "#5B8AB8", -- 蓝 · Azurite Blue — functions
  ljangkhu  = "#527559", -- 绿 · Malachite Green — strings, operators
  serpo     = "#A09058", -- 黄 · Orpiment Yellow (dimmed) — comments
  marpo     = "#BB4441", -- 红 · Cinnabar Red — errors

  -- Extended pigments
  likhri    = "#E85600", -- 铅丹 · Minium Orange — numbers, constants
  efebe     = "#EFE2BE", -- 白铅 · Lead White bright — types
  ngangpa   = "#9F7045", -- 土黄 · Yellow Ochre — warnings, regex
  metok     = "#C88090", -- 花色 · Lotus Pink — attributes, decorative
  mutsmen   = "#2F3B5B", -- 青金石 · Lapis Lazuli — deep reference
  nyima     = "#E0C888", -- 日光 · Sunlight — selection, search

  none      = "NONE",
}

-- ── Helpers ──────────────────────────────────────────────

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Setup ────────────────────────────────────────────────

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "sakya-dorje"

  -- ── Editor UI ──────────────────────────────────────────

  hi("Normal",       { fg = c.karpo,    bg = c.sa })
  hi("NormalFloat",  { fg = c.karpo,    bg = c.drak })
  hi("NormalNC",     { fg = c.drimed,   bg = c.sa })
  hi("FloatBorder",  { fg = c.surface2, bg = c.drak })
  hi("FloatTitle",   { fg = c.gser,     bg = c.drak, bold = true })

  hi("Cursor",       { fg = c.sa,       bg = c.gser })
  hi("CursorLine",   { bg = "#262638" })
  hi("CursorColumn", { bg = "#262638" })
  hi("ColorColumn",  { bg = c.shunyata })

  hi("LineNr",       { fg = c.disabled })
  hi("CursorLineNr", { fg = c.gser, bold = true })
  hi("SignColumn",   { bg = c.sa })
  hi("FoldColumn",   { fg = c.disabled, bg = c.sa })
  hi("Folded",       { fg = c.dulba,    bg = c.surface0 })

  hi("StatusLine",   { fg = c.drimed,   bg = c.shunyata })
  hi("StatusLineNC", { fg = c.disabled, bg = c.shunyata })
  hi("TabLine",      { fg = c.dulba,    bg = c.drak })
  hi("TabLineFill",  { bg = c.shunyata })
  hi("TabLineSel",   { fg = c.karpo,    bg = c.sa, bold = true })
  hi("WinBar",       { fg = c.drimed,   bg = c.sa })
  hi("WinBarNC",     { fg = c.disabled, bg = c.sa })
  hi("WinSeparator", { fg = c.surface0 })

  hi("Pmenu",        { fg = c.drimed,   bg = c.drak })
  hi("PmenuSel",     { fg = c.karpo,    bg = c.surface1 })
  hi("PmenuSbar",    { bg = c.surface0 })
  hi("PmenuThumb",   { bg = c.surface2 })

  hi("Visual",       { bg = "#E0C88833" })
  hi("VisualNOS",    { bg = "#E0C88833" })
  hi("Search",       { fg = c.sa,       bg = c.nyima })
  hi("IncSearch",    { fg = c.sa,       bg = c.gser })
  hi("CurSearch",    { fg = c.sa,       bg = c.gser, bold = true })
  hi("Substitute",   { fg = c.sa,       bg = c.marpo })

  hi("MatchParen",   { fg = c.gser, bold = true, underline = true })
  hi("NonText",      { fg = c.surface1 })
  hi("SpecialKey",   { fg = c.surface1 })
  hi("Whitespace",   { fg = c.surface0 })
  hi("EndOfBuffer",  { fg = c.surface0 })
  hi("Conceal",      { fg = c.disabled })
  hi("Directory",    { fg = c.ngonpo })
  hi("Title",        { fg = c.gser, bold = true })
  hi("ErrorMsg",     { fg = c.marpo })
  hi("WarningMsg",   { fg = c.ngangpa })
  hi("MoreMsg",      { fg = c.ljangkhu })
  hi("ModeMsg",      { fg = c.drimed, bold = true })
  hi("Question",     { fg = c.ngonpo })

  hi("DiffAdd",      { bg = "#52755933" })
  hi("DiffChange",   { bg = "#D2B45022" })
  hi("DiffDelete",   { bg = "#BB444133" })
  hi("DiffText",     { bg = "#D2B45044" })

  hi("SpellBad",     { sp = c.marpo,   undercurl = true })
  hi("SpellCap",     { sp = c.ngonpo,  undercurl = true })
  hi("SpellLocal",   { sp = c.ljangkhu, undercurl = true })
  hi("SpellRare",    { sp = c.metok,   undercurl = true })

  -- ── Syntax (standard Vim groups) ──────────────────────

  hi("Comment",      { fg = c.serpo, italic = true })

  hi("Constant",     { fg = c.likhri })
  hi("String",       { fg = c.ljangkhu })
  hi("Character",    { fg = c.ljangkhu })
  hi("Number",       { fg = c.likhri })
  hi("Boolean",      { fg = c.likhri })
  hi("Float",        { fg = c.likhri })

  hi("Identifier",   { fg = c.karpo })
  hi("Function",     { fg = c.ngonpo })

  hi("Statement",    { fg = c.gser })
  hi("Conditional",  { fg = c.gser })
  hi("Repeat",       { fg = c.gser })
  hi("Label",        { fg = c.gser })
  hi("Operator",     { fg = c.ljangkhu })
  hi("Keyword",      { fg = c.gser })
  hi("Exception",    { fg = c.gser })

  hi("PreProc",      { fg = c.gser })
  hi("Include",      { fg = c.gser })
  hi("Define",       { fg = c.gser })
  hi("Macro",        { fg = c.gser })
  hi("PreCondit",    { fg = c.gser })

  hi("Type",         { fg = c.efebe })
  hi("StorageClass", { fg = c.gser })
  hi("Structure",    { fg = c.efebe })
  hi("Typedef",      { fg = c.efebe })

  hi("Special",      { fg = c.likhri })
  hi("SpecialChar",  { fg = c.likhri })
  hi("Tag",          { fg = c.ngonpo })
  hi("Delimiter",    { fg = c.dulba })
  hi("SpecialComment", { fg = c.ngangpa or c.serpo, bold = true })
  hi("Debug",        { fg = c.marpo })

  hi("Underlined",   { fg = c.ngonpo, underline = true })
  hi("Error",        { fg = c.marpo })
  hi("Todo",         { fg = c.gser, bold = true })

  -- ── TreeSitter ────────────────────────────────────────

  hi("@comment",               { link = "Comment" })
  hi("@keyword",               { fg = c.gser })
  hi("@keyword.return",        { fg = c.gser })
  hi("@keyword.function",      { fg = c.gser })
  hi("@keyword.operator",      { fg = c.gser })
  hi("@keyword.import",        { fg = c.gser })
  hi("@keyword.conditional",   { fg = c.gser })
  hi("@keyword.repeat",        { fg = c.gser })
  hi("@keyword.exception",     { fg = c.gser })

  hi("@function",              { fg = c.ngonpo })
  hi("@function.call",         { fg = c.ngonpo })
  hi("@function.builtin",      { fg = c.ngonpo })
  hi("@function.method",       { fg = c.ngonpo })
  hi("@function.method.call",  { fg = c.ngonpo })

  hi("@constructor",           { fg = c.efebe })

  hi("@string",                { fg = c.ljangkhu })
  hi("@string.escape",         { fg = c.likhri })
  hi("@string.regex",          { fg = c.ngangpa })
  hi("@string.special",        { fg = c.likhri })

  hi("@number",                { fg = c.likhri })
  hi("@number.float",          { fg = c.likhri })
  hi("@boolean",               { fg = c.likhri })

  hi("@variable",              { fg = c.karpo })
  hi("@variable.builtin",      { fg = c.drimed })
  hi("@variable.parameter",    { fg = c.drimed })
  hi("@variable.member",       { fg = c.drimed })

  hi("@constant",              { fg = c.likhri })
  hi("@constant.builtin",      { fg = c.likhri })

  hi("@type",                  { fg = c.efebe })
  hi("@type.builtin",          { fg = c.efebe })
  hi("@type.definition",       { fg = c.efebe })

  hi("@property",              { fg = c.drimed })
  hi("@attribute",             { fg = c.metok })
  hi("@tag",                   { fg = c.ngonpo })
  hi("@tag.attribute",         { fg = c.metok })
  hi("@tag.delimiter",         { fg = c.dulba })

  hi("@operator",              { fg = c.ljangkhu })
  hi("@punctuation.bracket",   { fg = c.dulba })
  hi("@punctuation.delimiter", { fg = c.dulba })
  hi("@punctuation.special",   { fg = c.dulba })

  hi("@markup.heading",        { fg = c.gser, bold = true })
  hi("@markup.strong",         { fg = c.efebe, bold = true })
  hi("@markup.italic",         { fg = c.serpo, italic = true })
  hi("@markup.link",           { fg = c.ngonpo, underline = true })
  hi("@markup.link.url",       { fg = c.ngonpo, underline = true })
  hi("@markup.raw",            { fg = c.likhri })
  hi("@markup.list",           { fg = c.gser })

  -- ── LSP Semantic Tokens ───────────────────────────────

  hi("@lsp.type.function",     { link = "@function" })
  hi("@lsp.type.method",       { link = "@function.method" })
  hi("@lsp.type.parameter",    { link = "@variable.parameter" })
  hi("@lsp.type.property",     { link = "@property" })
  hi("@lsp.type.variable",     { link = "@variable" })
  hi("@lsp.type.type",         { link = "@type" })
  hi("@lsp.type.interface",    { link = "@type" })
  hi("@lsp.type.struct",       { link = "@type" })
  hi("@lsp.type.enum",         { link = "@type" })
  hi("@lsp.type.enumMember",   { link = "@constant" })
  hi("@lsp.type.keyword",      { link = "@keyword" })
  hi("@lsp.type.namespace",    { fg = c.drimed })
  hi("@lsp.type.decorator",    { fg = c.metok })

  -- ── Diagnostics ───────────────────────────────────────

  hi("DiagnosticError",          { fg = c.marpo })
  hi("DiagnosticWarn",           { fg = c.ngangpa })
  hi("DiagnosticInfo",           { fg = c.ngonpo })
  hi("DiagnosticHint",           { fg = c.dulba })
  hi("DiagnosticUnderlineError", { sp = c.marpo,   undercurl = true })
  hi("DiagnosticUnderlineWarn",  { sp = c.ngangpa, undercurl = true })
  hi("DiagnosticUnderlineInfo",  { sp = c.ngonpo,  undercurl = true })
  hi("DiagnosticUnderlineHint",  { sp = c.dulba,   undercurl = true })
  hi("DiagnosticVirtualTextError", { fg = c.marpo,   bg = "#BB444115" })
  hi("DiagnosticVirtualTextWarn",  { fg = c.ngangpa, bg = "#9F704515" })
  hi("DiagnosticVirtualTextInfo",  { fg = c.ngonpo,  bg = "#5B8AB815" })
  hi("DiagnosticVirtualTextHint",  { fg = c.dulba,   bg = "#9E978C15" })

  -- ── Git Signs ─────────────────────────────────────────

  hi("GitSignsAdd",    { fg = c.ljangkhu })
  hi("GitSignsChange", { fg = c.gser })
  hi("GitSignsDelete", { fg = c.marpo })

  -- ── Telescope ─────────────────────────────────────────

  hi("TelescopeNormal",        { fg = c.drimed, bg = c.drak })
  hi("TelescopeBorder",        { fg = c.surface2, bg = c.drak })
  hi("TelescopeTitle",         { fg = c.gser, bold = true })
  hi("TelescopePromptNormal",  { fg = c.karpo, bg = c.surface0 })
  hi("TelescopePromptBorder",  { fg = c.surface2, bg = c.surface0 })
  hi("TelescopePromptTitle",   { fg = c.gser, bg = c.surface0, bold = true })
  hi("TelescopePromptPrefix",  { fg = c.gser, bg = c.surface0 })
  hi("TelescopeSelection",     { bg = c.surface1 })
  hi("TelescopeMatching",      { fg = c.gser, bold = true })
  hi("TelescopePreviewNormal", { bg = c.sa })
  hi("TelescopePreviewBorder", { fg = c.surface2, bg = c.sa })
  hi("TelescopePreviewTitle",  { fg = c.gser, bg = c.sa })

  -- ── Lazy.nvim ─────────────────────────────────────────

  hi("LazyButton",       { fg = c.drimed, bg = c.surface0 })
  hi("LazyButtonActive", { fg = c.karpo,  bg = c.surface1, bold = true })
  hi("LazyH1",           { fg = c.gser, bold = true })
  hi("LazySpecial",      { fg = c.ngonpo })

  -- ── Indent Blankline ──────────────────────────────────

  hi("IblIndent", { fg = c.surface0 })
  hi("IblScope",  { fg = c.surface2 })

  -- ── Which Key ─────────────────────────────────────────

  hi("WhichKey",          { fg = c.gser })
  hi("WhichKeyGroup",     { fg = c.ngonpo })
  hi("WhichKeyDesc",      { fg = c.drimed })
  hi("WhichKeySeparator", { fg = c.disabled })

  -- ── Neotree / NvimTree ────────────────────────────────

  hi("NeoTreeNormal",      { fg = c.drimed, bg = c.drak })
  hi("NeoTreeNormalNC",    { fg = c.drimed, bg = c.drak })
  hi("NeoTreeDirectoryName", { fg = c.ngonpo })
  hi("NeoTreeGitAdded",   { fg = c.ljangkhu })
  hi("NeoTreeGitModified", { fg = c.gser })
  hi("NeoTreeGitDeleted", { fg = c.marpo })
  hi("NeoTreeIndentMarker", { fg = c.surface0 })
  hi("NeoTreeRootName",   { fg = c.gser, bold = true })

  hi("NvimTreeNormal",    { fg = c.drimed, bg = c.drak })
  hi("NvimTreeFolderIcon", { fg = c.ngonpo })
  hi("NvimTreeFolderName", { fg = c.ngonpo })
  hi("NvimTreeRootFolder", { fg = c.gser, bold = true })
  hi("NvimTreeGitDirty",  { fg = c.gser })
  hi("NvimTreeGitNew",    { fg = c.ljangkhu })
  hi("NvimTreeGitDeleted", { fg = c.marpo })

  -- ── Terminal ANSI colors ──────────────────────────────

  vim.g.terminal_color_0  = c.shunyata
  vim.g.terminal_color_1  = c.marpo
  vim.g.terminal_color_2  = c.ljangkhu
  vim.g.terminal_color_3  = c.gser
  vim.g.terminal_color_4  = c.ngonpo
  vim.g.terminal_color_5  = c.metok
  vim.g.terminal_color_6  = c.ljangkhu
  vim.g.terminal_color_7  = c.drimed
  vim.g.terminal_color_8  = c.surface2
  vim.g.terminal_color_9  = c.marpo
  vim.g.terminal_color_10 = c.ljangkhu
  vim.g.terminal_color_11 = c.nyima
  vim.g.terminal_color_12 = c.ngonpo
  vim.g.terminal_color_13 = c.metok
  vim.g.terminal_color_14 = c.ljangkhu
  vim.g.terminal_color_15 = c.karpo
end

return M
