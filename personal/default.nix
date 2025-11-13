let
  primaryUser = "ross";
in
{
  # macOS
  system.primaryUser = primaryUser;
  users.users.${primaryUser} = {
    home = "/Users/${primaryUser}";
  };

  # Home Manager
  home-manager = {
    extraSpecialArgs = { inherit primaryUser; };
    users.${primaryUser} = import ../common/home;
  };

  homebrew.casks = [
    "discord"
    "helium-browser"
    "transmission"
  ];

  system.keyboard = {
    enableKeyMapping = true; # enable key mapping so that we can use `option` as `control`
    remapCapsLockToEscape = true; # remap caps lock to escape
  };
}
