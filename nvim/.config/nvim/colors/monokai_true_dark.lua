vim.opt.background = 'dark'
vim.opt.termguicolors = true

vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' == 1 then
  vim.cmd 'syntax reset'
end

vim.g.colors_name = 'monokai_true_dark'

local c = {
  bg = '#000000',
  bg_alt = '#1c1c1c',
  fg = '#cccccc',
  fg_bright = '#f1f1f1',
  line = '#252526',
  gutter = '#3a3a3b',
  comment = '#696d70',
  selection = '#59201b',
  selection_inactive = '#402725',
  red = '#e62a19',
  pink = '#f92672',
  yellow = '#e6db74',
  cyan = '#49e0fd',
  purple = '#ae81ff',
  orange = '#fd971f',
  green = '#2be98a',
  lime = '#b0ec38',
  blue = '#328eff',
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hl('Normal', { fg = c.fg, bg = c.bg })
hl('NormalNC', { fg = c.fg, bg = c.bg })
hl('NormalFloat', { fg = c.fg, bg = c.bg_alt })
hl('FloatBorder', { fg = c.line, bg = c.bg_alt })
hl('FloatTitle', { fg = c.cyan, bg = c.bg_alt, bold = true })
hl('ColorColumn', { bg = c.line })
hl('CursorLine', { bg = c.line })
hl('CursorColumn', { bg = c.line })
hl('CursorLineNr', { fg = c.yellow, bg = c.bg, bold = true })
hl('LineNr', { fg = c.gutter, bg = c.bg })
hl('SignColumn', { bg = c.bg })
hl('VertSplit', { fg = c.line, bg = c.bg })
hl('WinSeparator', { fg = c.line, bg = c.bg })
hl('Folded', { fg = c.comment, bg = c.bg_alt })
hl('FoldColumn', { fg = c.comment, bg = c.bg })
hl('StatusLine', { fg = c.fg, bg = c.bg_alt })
hl('StatusLineNC', { fg = c.comment, bg = c.bg_alt })
hl('TabLine', { fg = c.comment, bg = c.bg_alt })
hl('TabLineSel', { fg = c.fg_bright, bg = c.line, bold = true })
hl('TabLineFill', { fg = c.comment, bg = c.bg })
hl('Pmenu', { fg = c.fg, bg = c.bg_alt })
hl('PmenuSel', { fg = c.bg, bg = c.cyan, bold = true })
hl('PmenuSbar', { bg = c.line })
hl('PmenuThumb', { bg = c.comment })
hl('Visual', { bg = c.selection })
hl('VisualNOS', { bg = c.selection_inactive })
hl('Search', { fg = c.bg, bg = c.yellow })
hl('IncSearch', { fg = c.bg, bg = c.orange, bold = true })
hl('CurSearch', { fg = c.bg, bg = c.orange, bold = true })
hl('MatchParen', { fg = c.pink, bg = c.line, bold = true })
hl('NonText', { fg = c.gutter })
hl('Whitespace', { fg = c.gutter })

hl('Comment', { fg = c.comment, italic = true })
hl('Constant', { fg = c.purple })
hl('String', { fg = c.yellow })
hl('Character', { fg = c.red })
hl('Number', { fg = c.purple })
hl('Boolean', { fg = c.purple })
hl('Float', { fg = c.purple })
hl('Identifier', { fg = c.orange })
hl('Function', { fg = c.lime })
hl('Statement', { fg = c.pink })
hl('Conditional', { fg = c.pink })
hl('Repeat', { fg = c.pink })
hl('Label', { fg = c.pink })
hl('Operator', { fg = c.pink })
hl('Keyword', { fg = c.pink })
hl('Exception', { fg = c.pink })
hl('PreProc', { fg = c.cyan })
hl('Include', { fg = c.pink })
hl('Define', { fg = c.cyan })
hl('Macro', { fg = c.cyan })
hl('PreCondit', { fg = c.cyan })
hl('Type', { fg = c.green })
hl('StorageClass', { fg = c.cyan })
hl('Structure', { fg = c.green })
hl('Typedef', { fg = c.green })
hl('Special', { fg = c.cyan })
hl('SpecialChar', { fg = c.red })
hl('Tag', { fg = c.pink })
hl('Delimiter', { fg = c.pink })
hl('SpecialComment', { fg = c.comment })
hl('Debug', { fg = c.red })
hl('Error', { fg = c.red, bg = c.bg, bold = true })
hl('Todo', { fg = c.bg, bg = c.blue, bold = true })

hl('DiagnosticError', { fg = c.red })
hl('DiagnosticWarn', { fg = c.yellow })
hl('DiagnosticInfo', { fg = c.cyan })
hl('DiagnosticHint', { fg = c.green })
hl('DiagnosticUnderlineError', { undercurl = true, sp = c.red })
hl('DiagnosticUnderlineWarn', { undercurl = true, sp = c.yellow })
hl('DiagnosticUnderlineInfo', { undercurl = true, sp = c.cyan })
hl('DiagnosticUnderlineHint', { undercurl = true, sp = c.green })

hl('DiffAdd', { fg = c.green, bg = c.bg_alt })
hl('DiffDelete', { fg = c.pink, bg = c.bg_alt })
hl('DiffChange', { fg = c.purple, bg = c.bg_alt })
hl('DiffText', { fg = c.blue, bg = c.line, bold = true })
hl('GitSignsAdd', { fg = c.green, bg = c.bg })
hl('GitSignsChange', { fg = c.purple, bg = c.bg })
hl('GitSignsDelete', { fg = c.pink, bg = c.bg })

hl('TelescopeNormal', { fg = c.fg, bg = c.bg })
hl('TelescopeBorder', { fg = c.line, bg = c.bg })
hl('TelescopePromptNormal', { fg = c.fg, bg = c.bg_alt })
hl('TelescopePromptBorder', { fg = c.line, bg = c.bg_alt })
hl('TelescopeSelection', { fg = c.fg_bright, bg = c.line, bold = true })
hl('TelescopeMatching', { fg = c.yellow, bold = true })

hl('NvimTreeNormal', { fg = c.fg, bg = c.bg })
hl('NvimTreeNormalNC', { fg = c.fg, bg = c.bg })
hl('NvimTreeWinSeparator', { fg = c.line, bg = c.bg })
hl('NvimTreeFolderName', { fg = c.cyan })
hl('NvimTreeOpenedFolderName', { fg = c.cyan, bold = true })
hl('NvimTreeSpecialFile', { fg = c.purple, underline = true })

local links = {
  ['@annotation'] = 'PreProc',
  ['@attribute'] = 'Identifier',
  ['@boolean'] = 'Boolean',
  ['@character'] = 'Character',
  ['@comment'] = 'Comment',
  ['@constant'] = 'Constant',
  ['@constant.builtin'] = 'Constant',
  ['@constant.macro'] = 'Constant',
  ['@constructor'] = 'Special',
  ['@exception'] = 'Exception',
  ['@field'] = 'Identifier',
  ['@function'] = 'Function',
  ['@function.builtin'] = 'Function',
  ['@function.call'] = 'Function',
  ['@function.macro'] = 'Function',
  ['@keyword'] = 'Keyword',
  ['@keyword.function'] = 'Keyword',
  ['@keyword.operator'] = 'Operator',
  ['@keyword.return'] = 'Keyword',
  ['@label'] = 'Label',
  ['@method'] = 'Function',
  ['@namespace'] = 'Type',
  ['@number'] = 'Number',
  ['@operator'] = 'Operator',
  ['@parameter'] = 'Identifier',
  ['@property'] = 'Identifier',
  ['@punctuation.bracket'] = 'Delimiter',
  ['@punctuation.delimiter'] = 'Delimiter',
  ['@punctuation.special'] = 'Special',
  ['@string'] = 'String',
  ['@string.escape'] = 'SpecialChar',
  ['@string.regex'] = 'Special',
  ['@tag'] = 'Tag',
  ['@tag.attribute'] = 'Identifier',
  ['@tag.delimiter'] = 'Delimiter',
  ['@type'] = 'Type',
  ['@type.builtin'] = 'Type',
  ['@variable'] = 'Identifier',
  ['@variable.builtin'] = 'Constant',
}

for group, target in pairs(links) do
  hl(group, { link = target })
end

local terminal = {
  c.bg,
  c.red,
  c.green,
  c.yellow,
  c.blue,
  c.pink,
  c.cyan,
  c.fg,
  c.comment,
  c.red,
  c.green,
  c.yellow,
  c.blue,
  c.pink,
  c.cyan,
  c.fg_bright,
}

for index, color in ipairs(terminal) do
  vim.g['terminal_color_' .. (index - 1)] = color
end
