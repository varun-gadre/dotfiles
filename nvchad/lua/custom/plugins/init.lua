-- custom/plugins/init.lua has to return a table
-- THe plugin name is github user or organization name/reponame

return {
   ["folke/trouble.nvim"] =
   {
      requires = "kyazdani42/nvim-web-devicons",
      config = function ()
        require("trouble").setup{}
      end
   },
   ["nvim-telescope/telescope-fzf-native.nvim"] = {
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      config = function ()
        require('telescope').load_extension('fzf')
      end
   },
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
