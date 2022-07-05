-- leuven lualine theme

local palette = vim.g['leuven#palette']
local colors = {
  bg              = palette.bg[1],
  gray_dark_bg    = palette.gray_dark_bg[1],
  gray_dark_fg    = palette.gray_dark_fg[1],
  gray_bg         = palette.gray_bg[1],
  blue_on_bg      = palette.blue_on_bg[1],
  blue_on_fg      = palette.blue_on_fg[1],
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

return {
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
