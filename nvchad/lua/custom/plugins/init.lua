-- custom/plugins/init.lua has to return a table
-- THe plugin name is github user or organization name/reponame

return {

   ["elkowar/yuck.vim"] = { ft = "yuck" },
   ["goolord/alpha-nvim"] = {
         disable = false,
      },
   ["max397574/better-escape.nvim"] = {
      event = "InsertEnter",
      config = function()
         require("better_escape").setup()
      end,
   },
   ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  }
}
