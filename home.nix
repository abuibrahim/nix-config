{ config, pkgs, ... }:
{
  home = {
    username = "abdurrahman";
    homeDirectory = "/home/abdurrahman";
    packages = with pkgs; [
      ripgrep
      lsd
      fzf
      google-chrome
      nixd
      nixfmt-rfc-style
      cascadia-code
    ];
    stateVersion = "25.05";
  };

  services = {
    emacs = {
      enable = true;
      client.enable = true;
      defaultEditor = true;
    };
  };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts.monospace = [ "Cascadia Code NF" ];
    };
  };

  dconf.settings = {
    #"org/gnome/mutter" = {
    #  experimental-features = [ "scale-monitor-framebuffer" ];
    #};
    "org/gnome/desktop/interface" = {
      monospace-font-name = "Cascadia Code NF 10";
      scaling-factor = 1.2;
    };
  };

  programs = {
    starship.enable = true;

    ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        theme = "catppuccin-mocha";
        font-family = "Cascadia Code NF";
        font-size = 10;
      };
    };

    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    nix-index = {
      enable = true;
      enableFishIntegration = true;
    };

    git = {
      enable = true;
      userName = "Abdurrahman Hussain";
      userEmail = "2321000+abuibrahim@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    vscode = {
      enable = true;
      profiles.default = {
        userSettings = {
          "extensions.autoUpdate" = false;
          "telemetry.telemetryLevel" = "off";
          "workbench.preferredLightColorTheme" = "Catppuccin Latte";
          "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";
          "workbench.colorTheme" = "Catppuccin Mocha";
          "workbench.iconTheme" = "catppuccin-mocha";
          "editor.fontLigatures" = true;
          "editor.inlayHints.enabled" = "offUnlessPressed";
        };

        extensions = with pkgs.vscode-extensions; [
          catppuccin.catppuccin-vsc
          catppuccin.catppuccin-vsc-icons
          ms-vscode.cmake-tools
          llvm-vs-code-extensions.vscode-clangd
          vadimcn.vscode-lldb
          rust-lang.rust-analyzer
          jnoortheen.nix-ide
          tamasfe.even-better-toml
          zxh404.vscode-proto3
          github.vscode-pull-request-github
          github.copilot
        ];
      };
    };

    vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        lightline-vim
        catppuccin-vim
      ];
      extraConfig = ''
        colorscheme catppuccin_mocha
        let g:lightline = {'colorscheme': 'catppuccin_mocha'}
        set number
        set mouse=a
      '';
    };

    emacs = {
      enable = true;
      package = pkgs.emacs-pgtk;
      extraPackages =
        epkgs: with epkgs; [
          magit
          smartparens
          nix-mode
          catppuccin-theme
          ligature
          rust-mode
          treesit-grammars.with-all-grammars
        ];
    };

    zellij = {
      enable = true;
      settings = {
        theme = "catppuccin-mocha";
      };
    };
  };
}
