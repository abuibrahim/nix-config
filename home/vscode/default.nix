{ pkgs, hostname, ... }:
let
  configurations = if pkgs.stdenv.isLinux then "nixosConfigurations" else "darwinConfigurations";
in
{
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;

    profiles.default = {
      userSettings = {
        "extensions.autoUpdate" = false;
        "telemetry.telemetryLevel" = "off";
        "workbench.startupEditor" = "none";
        "workbench.preferredLightColorTheme" = "Catppuccin Latte";
        "workbench.preferredDarkColorTheme" = "Catppuccin Mocha";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "window.autoDetectColorScheme" = true;
        "editor.fontFamily" = "JetBrainsMono NF";
        "editor.fontLigatures" = true;
        "editor.inlayHints.enabled" = "offUnlessPressed";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nix.formatterPath" = "nixfmt";
        "nix.serverSettings.nixd.formatting.command" = [ "nixfmt" ];
        "nix.serverSettings.nixd.nixpkgs.expr" = "(builtins.getFlake (toString ./.)).inputs.nixpkgs";
        "nix.serverSettings.nixd.options.nixos.expr" =
          "(builtins.getFlake (toString ./.)).${configurations}.${hostname}.options";
        "nix.serverSettings.nixd.options.home-manager.expr" =
          "(builtins.getFlake (toString ./.)).${configurations}.${hostname}.options.home-manager.users.type.getSubOptions []";
      };

      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        ms-vscode.cmake-tools
        ms-python.python
        llvm-vs-code-extensions.vscode-clangd
        vadimcn.vscode-lldb
        haskell.haskell
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
        tamasfe.even-better-toml
        zxh404.vscode-proto3
        github.vscode-pull-request-github
        github.copilot
      ];
    };
  };
}
