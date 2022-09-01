-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,

-- example of changing theme:
local pluginConfs = require "custom.plugins.configs"


M.ui = {
  theme = "tokyonight",
}

M.plugins = {
   override = {
      ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
      ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
   },
   user = require "custom.plugins",
}

return M
