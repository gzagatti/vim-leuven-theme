if vim.opt:get('termguicolors') then
else
  return {
    normal = {
      a = {fg = "#eeeeee", bg = "#005faf", gui = "bold"},
      b = {fg = "#85ceeb", bg = "#005faf"},
      c = {fg = "#85ceeb", bg = "#454545"},
      y = {fg = "#85ceeb", bg = "#005faf"},
      z = {fg = "#85ceeb", bg = "#005faf"},

    },
    inactive = {
      a = {fg = "#eeeeee", bg = "#a9a9a9"},
      b = {fg = "#eeeeee", bg = "#686868"},
      c = {fg = "#eeeeee", bg = "#a9a9a9"},
    }
  }
end
