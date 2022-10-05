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
  },
  ['mfussenegger/nvim-dap'] = {},
  ['rrethy/vim-illuminate'] = {},

  ['simrat39/rust-tools.nvim'] = {
        after = "nvim-lspconfig",
        config = function()
            local rt = require('rust-tools')
            rt.setup({
                tools = {
                    crate_graph = {
                        full = false,
                        backend = "png",
                        output = "./crate-graph.png",
                    },
                    inlay_hints = {
                        auto = true,
                    },
                },
                server = {
                    settings = {
                        on_attach = function(_, bufnr)
                            -- Hover actions
                            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
                            -- Code action groups
                            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                        end,
                        ['rust-analyzer'] = {
                            assist = {
                                importPrefix = "by_self",
                            },
                            cargo = {
                                allFeatures = true,
                            },
                            checkOnSave = {
                                command = "cargo clippy && cargo +nightly format"
                            },
                            lens = {
                                references = true,
                                methodReferences = true,
                            },
                        }
                    }
                }
            })
        end
    }
}
