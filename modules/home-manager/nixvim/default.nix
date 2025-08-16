{ inputs, ... }:
{
  imports = [ inputs.nixvim.homeModules.nixvim ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    editorconfig.enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        transparent_background = true;
      };
    };

    opts = {
      number = true;
    };

    plugins = {
      lualine.enable = true;
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          nixd.enable = true;
          clangd.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
        };
      };
    };
  };
}
