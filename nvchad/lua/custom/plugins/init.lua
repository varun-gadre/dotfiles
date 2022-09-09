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
      after = "telescope.nvim",
      config = function()
      require('telescope').setup {
        extensions = {
           fzf = {
              fuzzy = true,                    -- false will only do exact matching
              override_generic_sorter = true,  -- override the generic sorter
              override_file_sorter = true,     -- override the file sorter
              case_mode = "smart_case",        -- or "ignore_case" or "respect_case"                         -- the default case_mode is "smart_case"
          }
        }
      }
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
