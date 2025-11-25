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
    users.${primaryUser} = {
      imports = [
        ../common/home
        ./home
      ];
    };
  };

  homebrew.casks = [
    "discord"
    "helium-browser"
    "transmission"
    "ungoogled-chromium"
  ];
}
