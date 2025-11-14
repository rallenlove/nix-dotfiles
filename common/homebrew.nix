{ ... }:
{
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };

    casks = [
      "colemak-dh"
      "firefox"
      "ghostty"
      "zed"
      "zen"
    ];
  };
}
