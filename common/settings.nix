{ pkgs, self, ... }:
{
  # touch ID for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {
    # Set Git commit hash for darwin-version.
    configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 6;

    startup.chime = false;

    defaults = {
      dock = {
        expose-group-apps = true;
        mineffect = "scale";
        mru-spaces = true; # automatically rearrange spaces based on most recent use
        show-recents = false; # disable recent apps
      };

      finder.ShowPathbar = true; # breadcrumb nav at bottom

      NSGlobalDomain = {
        AppleShowAllExtensions = true; # file extensions
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        # NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSWindowShouldDragOnGesture = true; # ctrl + cmd to drag anywhere on window
      };
    };

    keyboard = {
      enableKeyMapping = true; # enable key mapping so that we can use `option` as `control`
      remapCapsLockToEscape = true; # remap caps lock to escape
    };
  };

  environment.variables.HOMEBREW_NO_ENV_HINTS = "1"; # Have this in 2 places--does either work?

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  # programs.zsh.enable = true;
  # environment.shells = [ pkgs.zsh ]; # Don't understand this--messes up system zsh

  # Fonts
  fonts = {
    packages = with pkgs; [
      # icon fonts
      # material-design-icons
      # font-awesome

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable-small/pkgs/data/fonts/nerd-fonts/manifests/fonts.json
      nerd-fonts.symbols-only # symbols icon only
      nerd-fonts.fira-code
    ];
  };
}
