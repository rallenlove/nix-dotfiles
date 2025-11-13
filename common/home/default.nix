{ primaryUser, ... }:
{
  imports = [
    ./packages.nix
    ./programs
  ];

  home = {
    username = primaryUser;

    # The state version is required and should stay at the version you
    # originally installed.
    stateVersion = "25.05";

    # Create .hushlogin file to suppress login messages
    file.".hushlogin".text = "";

    sessionVariables.HOMEBREW_NO_ENV_HINTS = 1; # this doesn't work?
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Enable management of XDG base directories
  xdg.enable = true;
}
