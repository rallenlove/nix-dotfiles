{ ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      theme = "solarized-dark";
      on_force_close = "quit";
    };
  };

  xdg.configFile."zellij/layouts/1.kdl".source = ./layouts/1.kdl;
}
