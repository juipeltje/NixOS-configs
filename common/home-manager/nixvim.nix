# Home Manager nixvim configuration.

{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    plugins = {
      lualine = {
        enable = true;
      };

      web-devicons = {
        enable = true;
      };

      telescope = {
        enable = true;
      };

      lsp = {
        enable = true;
      };

      blink-cmp = {
        enable = true;
      };

      nix = {
        enable = true;
      };

      dashboard = {
        enable = true;
        settings = {
          change_to_vcs_root = true;
          config = {
            footer = [
              "Made with ❤️"
            ];
            header = [
            "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
            "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
            "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
            "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
            "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
            "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
            ];
            mru = {
            limit = 20;
            };
            project = {
              enable = false;
            };
            shortcut = [
              {
                action = {
                  __raw = "function(path) vim.cmd('Telescope find_files') end";
                };
                desc = "Files";
                group = "Label";
                icon = " ";
                icon_hl = "@variable";
                key = "f";
              }
              {
                action = "Telescope app";
                desc = " Apps";
                group = "DiagnosticHint";
                key = "a";
              }
              {
                action = "Telescope dotfiles";
                desc = " dotfiles";
                group = "Number";
                key = "d";
              }
            ];
            week_header = {
              enable = false;
            };
          };
          theme = "hyper";
        };
      };
    };

    colorschemes = {
      gruvbox = {
        enable = true;
      };
    };

    globals.mapleader = " ";
    opts.number = true;
    keymaps = [
      {
        action = "<cmd>Telescope find_files<cr>";
        key = "<leader>ff";
        mode = "n";
      }
    ];

    lsp.servers = {
      nixd = {
        enable = true;
        settings = {
          formatting.command = [ "nixfmt" ];          
          options = {
            home-manager.expr = "(builtins.getFlake (builtins.toString /home/joppe/repos/configs/nix)).homeConfigurations.\"joppe@Void-Rig\".options";
          };
        };
      };
    };
  };
}
