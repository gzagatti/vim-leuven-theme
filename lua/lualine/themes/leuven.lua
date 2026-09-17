-- leuven lualine theme

local palette = vim.g['leuven#palette']
local colors = {
  bg              = palette.bg[1],
  gray_dark_bg    = palette.gray_dark_bg[1],
  gray_dark_fg    = palette.gray_dark_fg[1],
  gray_bg         = palette.gray_bg[1],
  blue_on_bg      = palette.blue_on_bg[1],
  blue_on_fg      = palette.blue_on_fg[1],
  magenta_dark_fg = palette.magenta_dark_fg[1],
  magenta_bg      = palette.magenta_bg[1],
  green_light_fg  = palette.green_light_fg[1],
  green_bg        = palette.green_bg[1],
  yellow_fg       = palette.yellow_fg[1],
  yellow_light_bg = palette.yellow_light_bg[1],
}

-- adjust colors when termguicolors is not available
if vim.opt.termguicolors:get() == false then
  colors.bg = '#eeeeee'
  colors.blue_on_bg = '#005faf'
end

local theme = {
  normal = {
    a = {fg = colors.bg, bg = colors.blue_on_bg, gui = 'bold'},
    b = {fg = colors.blue_on_fg, bg = colors.blue_on_bg},
    c = {fg = colors.blue_on_fg, bg = colors.gray_dark_fg},
    y = {fg = colors.blue_on_fg, bg = colors.blue_on_bg},
    z = {fg = colors.blue_on_fg, bg = colors.blue_on_bg},
  },
  insert = {
    a = {fg = colors.green_light_fg, bg = colors.green_bg, gui = 'bold'},
    b = {fg = colors.blue_on_fg, bg = colors.blue_on_bg},
    c = {fg = colors.blue_on_fg, bg = colors.gray_dark_fg},
    y = {fg = colors.blue_on_fg, bg = colors.blue_on_bg},
    z = {fg = colors.blue_on_fg, bg = colors.blue_on_bg},
  },
  visual = {
    a = {fg = colors.yellow_fg, bg = colors.yellow_light_bg, gui = 'bold'},
    b = {fg = colors.blue_on_fg, bg = colors.blue_on_bg},
    c = {fg = colors.blue_on_fg, bg = colors.gray_dark_fg},
    y = {fg = colors.blue_on_fg, bg = colors.blue_on_bg},
    z = {fg = colors.blue_on_fg, bg = colors.blue_on_bg},
  },
  inactive = {
    a = {fg = colors.bg, bg = colors.gray_bg},
    b = {fg = colors.bg, bg = colors.gray_dark_bg},
    c = {fg = colors.bg, bg = colors.gray_bg},
  },
}

local special = {
  a = {fg = colors.bg, bg = colors.magenta_dark_fg, gui = 'bold'},
  b = {fg = colors.magenta_bg, bg = colors.magenta_dark_fg},
  c = {fg = colors.magenta_bg, bg = colors.gray_dark_fg},
  y = {fg = colors.magenta_bg, bg = colors.magenta_dark_fg},
  z = {fg = colors.magenta_bg, bg = colors.magenta_dark_fg},
}

local function special_buffer()
  local winid = tonumber(vim.g.statusline_winid)
  if not winid or not vim.api.nvim_win_is_valid(winid) then
    winid = vim.api.nvim_get_current_win()
  end
  local bufnr = vim.api.nvim_win_get_buf(winid)
  local name = vim.api.nvim_buf_get_name(bufnr)
  return name:match('^fugitive://') ~= nil
    or vim.bo[bufnr].buftype ~= ''
    or vim.bo[bufnr].readonly
    or not vim.bo[bufnr].modifiable
end

local function active_color(section, regular)
  return function()
    return special_buffer() and special[section] or regular
  end
end

for mode, sections in pairs(theme) do
  if mode ~= 'inactive' then
    for section, color in pairs(sections) do
      sections[section] = active_color(section, color)
    end
  end
end

return theme
