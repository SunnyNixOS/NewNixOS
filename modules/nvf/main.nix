{pkgs, lib, nvf, ... }:

{

    programs.nvf = {
        enable = true;
        settings = {
            vim.opt.number = true;
            vim.opt.relativenumber = true;
        };
    };
}