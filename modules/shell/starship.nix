{
  flake.modules.homeManager = {
    programs.starship = {
      enable = true;
      enableTransience = true;
      settings = {
        character = {
          success_symbol = "[ ](bold green)";
          error_symbol = "[ ](bold red)";
        };
      };
    };
  };
}
