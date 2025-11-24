let
  primaryUser = "rosslovelace";
in
{
  # macOS
  system.primaryUser = primaryUser;
  users.users.${primaryUser} = {
    home = "/Users/${primaryUser}";
  };

  home-manager.extraSpecialArgs = { inherit primaryUser; };
  home-manager.users.${primaryUser} = {
    imports = [
      ../common/home
      ./home
    ];
  };

  homebrew = {
    brews = [
      # Special installation steps from khan-dotfiles
      "openjdk@11"
      "postgresql@14"
      # Specific versions
      "go@1.23"
      "node@20"
      "python@3.11"
      # The rest
      "coreutils"
      "fastly" # requires fastly tap
      "imagemagick"
      "jq"
      "openssl"
      "pyenv"
      "redis"
      "watchman"
      "wget"
    ];

    casks = [
      "cursor"
      "docker-desktop"
      "google-chrome"
      "slack"
      "visual-studio-code"
    ];

    taps = [
      "fastly/tap"
    ];
  };
}
