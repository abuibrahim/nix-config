{
  flake.modules.homeManager.shell = {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
      defaultCommand = "fd --type f";
      fileWidgetCommand = "fd --type f";
      fileWidgetOptions = [
        "--style full"
        "--height 100%"
        "--preview 'bat --number --color=always {}'"
        "--bind 'focus:transform-header:file --brief {}'"
      ];
    };
  };
}
