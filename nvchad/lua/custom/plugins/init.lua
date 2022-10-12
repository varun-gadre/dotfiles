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
  ['mfussenegger/nvim-dap'] = {
        after = "rust-tools.nvim",
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = 'C:\\Users\\omnicom\\AppData\\Local\\nvim-data\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe',
                options = {
                    detached = false
                },
                setupCommands = { 
                    {
                        text = '-enable-pretty-printing',
                        description =  'enable pretty printing',
                        ignoreFailures = false 
                    },
                }
            }
            local source_file_map = 'C:\\Users\\omnicom\\dev\\rs-omnicom\\src'
            dap.configurations.rust = {
                {
                    name = "Rust debug",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = true,
                    sourceFileMap = {
                        source_file_map = {
                            editorPath = source_file_map,
                            useForBreakpoints = true
                        }
                    }

                },
            }
        end
    },
    ["rcarriga/nvim-dap-ui"] = {
        after = "nvim-dap",
        config = function ()
            local dapui = require("dapui")
            dapui.setup()
        end
    },
    ['rrethy/vim-illuminate'] = {},

    ['simrat39/rust-tools.nvim'] = {
        after = "nvim-lspconfig",
        config = function()
            local extension_path = vim.env.HOME .. '\\.vscode\\extensions\\vadimcn.vscode-lldb-1.6.7\\'
            local codelldb_path = extension_path .. 'adapter\\codelldb'
            local liblldb_path = extension_path .. 'lldb\\lib\\liblldb.lib'
            local rt = require("rust-tools")
            rt.setup({
                tools = {
                    inlay_hints = {
                        auto = true,
                    },
                    hover_actions = {
                        auto_focus = true,
                    }
                },
                server = {
                    on_attach = function(_, bufnr)
                        -- Hover actions
                        vim.keymap.set("n", "<Leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
                        -- Code action groups
                        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end,
                },
            })
        end
    }
}
