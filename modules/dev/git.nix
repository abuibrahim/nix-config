topLevel: {
  flake.modules.homeManager.dev =
    { config, ... }:
    {
      programs.git = {
        enable = true;
        userName = topLevel.config.flake.meta.users.${config.home.username}.name;
        userEmail = topLevel.config.flake.meta.users.${config.home.username}.email;
        ignores = [
          ".direnv"
        ];
        extraConfig = {
          init.defaultBranch = "main";
          pull.ff = "only";
        };
      };
    };
}
