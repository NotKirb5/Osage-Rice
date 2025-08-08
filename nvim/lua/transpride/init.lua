local M = {}

local colors = {
  pink = "#CC7FCD",
  lightpink = "#fca6d1",
  white = "#ffffff",
  blue = "#53C2C3",
  lightblue = "#80C6C9",
  green = "#40C26C",
  lightgreen = "#5DD68B",
  yellow = "#FECE0B",
  purple = "#4B365F",
  red = "#E10600",
  gray = "#b2b2b2",
}

function M.colorscheme()
  vim.cmd("highlight clear")
  vim.cmd("syntax reset")

  vim.background = "none"
  vim.g.colors_name = "trans pride"

  local set = vim.api.nvim_set_hl

  set(0, "Normal", { bg = "none", fg = colors.white })
  set(0, "Comment", { fg = colors.purple, italic = true })
  set(0, "Constant", { fg = colors.blue })
  set(0, "Variable", { fg = colors.blue })
  set(0, "String", { fg = colors.green })
  set(0, "Identifier", { fg = colors.pink })
  set(0, "Function", { fg = colors.lightpink })
  set(0, "Statement", { fg = colors.pink })
  set(0, "Type", { fg = colors.blue })
  set(0, "Special", { fg = colors.blue })
  set(0, "Error", { fg = colors.red, bold = true })
  set(0, "Operator", { fg = colors.pink })
end

return M
