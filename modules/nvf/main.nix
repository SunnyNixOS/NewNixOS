{pkgs, lib, nvf, ... }:

{
    programs.nvf = {
        enable = true;

        settings.vim = {
                lsp.enable = true;
                vimAlias = true;
                viAlias = true;
                enableLuaLoader = true;
                preventJunkFiles = true;


                telescope.enable = true;
                lineNumberMode = "relNumber";
                options = {
                    splitbelow = true;
                    splitright = true;
                    wrap = false;
                    tabstop = 4;
                    shiftwidth = 2;
                };

                globals = {
                  mapleader = " ";
                  maplocalleader = " ";
                };

                keymaps = [
              {
                key = "<leader>y";
                mode = "n";
                silent = true;
                action = ":Yazi<CR>";
              }

              {
                key = "<leader>ff";
                mode = "n";
                action = "<cmd>Telescope find_files<CR>";
              }
            
              {
                key = "<leader>fg";
                mode = "n";
                action = "<cmd>Telescope live_grep<CR>";
              }
                ];


                clipboard = {
                    enable = true;
                    registers = "unnamedplus";
                    providers = {
                        wl-copy.enable = true;
                        xsel.enable = true;
                        };
                };


                languages = {
                    enableFormat = true;
                    enableTreesitter = true;

                    nix.enable = true;
                    python.enable = true;
                    css.enable = true;
                    html.enable = true;
                };

                statusline.lualine = {
                    enable = true;
                    theme = "base16";
                };

                extraPlugins = {

                    yazi = {
                        package = pkgs.vimPlugins.yazi-nvim;
                        setup = ''
                        vim.keymap.set("n", "<leader>-", function()
                            require("yazi").yazi()
                        end)

                        vim.g.loaded_netrwPlugin = 1

                        vim.api.nvim_create_autocmd("UIEnter", {
                            callback = function()
                                require("yazi").setup({
                                    open_for_directories = true,
                                })
                            end,
                        })
                        '';
                    };
                };

            };

        };
}
