{ theme, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  xdg.configFile."starship.toml".source = ./${theme.starship}.toml;
}
