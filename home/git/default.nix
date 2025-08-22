{
  programs.git = {
    enable = true;
    userName = "Abdurrahman Hussain";
    userEmail = "2321000+abuibrahim@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.ff = "only";
    };
  };
}
