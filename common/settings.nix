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
        # mru-spaces = true; # automatically rearrange spaces based on most recent use
        show-recents = false; # disable recent apps
      };

      finder = {
        _FXSortFoldersFirst = true; # when sorting by name
        _FXSortFoldersFirstOnDesktop = true;
        # FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "clmv"; # column view
        FXRemoveOldTrashItems = true; # after 30 days
        NewWindowTarget = "Home";
        ShowPathbar = true; # breadcrumb nav at bottom
      };

      NSGlobalDomain = {
        AppleShowAllExtensions = true; # file extensions
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        # NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSWindowShouldDragOnGesture = true; # ctrl + cmd to drag anywhere on window
      };

      # WindowManager = {
      #   EnableTiledWindowMargins = false;
      #   EnableTilingByEdgeDrag = true;
      # };
      # WindowManager.EnableTiledWindowMargins = false;
    };

    keyboard = {
      enableKeyMapping = true; # enable key mapping so that we can use `option` as `control`
      remapCapsLockToEscape = true; # remap caps lock to escape
    };
  };

  # Fonts
  fonts.packages = with pkgs; [
    # icon fonts
    # material-design-icons
    # font-awesome

    # nerdfonts
    # https://github.com/NixOS/nixpkgs/blob/nixos-unstable-small/pkgs/data/fonts/nerd-fonts/manifests/fonts.json
    nerd-fonts.symbols-only # symbols only
    nerd-fonts.atkynson-mono
    nerd-fonts.commit-mono
    nerd-fonts.envy-code-r
    nerd-fonts.fira-code
    nerd-fonts.intone-mono
    nerd-fonts.iosevka
    nerd-fonts.monoid
    nerd-fonts.mononoki
    nerd-fonts.open-dyslexic
    nerd-fonts.recursive-mono
    nerd-fonts.sauce-code-pro
    nerd-fonts.shure-tech-mono
    nerd-fonts.victor-mono
  ];
}
