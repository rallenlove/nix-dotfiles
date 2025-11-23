{ ... }:
{
  programs.zellij = {
    enable = true;
    # enableZshIntegration = true;
    settings = {
      theme = "solarized-dark";
      default_layout = "0";
      on_force_close = "quit";
    };
  };

  # xdg.configFile."zellij/layouts/1.kdl".source = ./layouts/1.kdl;
  xdg.configFile."zellij/layouts".source = ./layouts;
}
