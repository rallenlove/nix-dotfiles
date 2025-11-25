{ config, ... }:
{
  # Personal-specific zsh configuration
  programs.zsh = {
    dotDir = "${config.xdg.configHome}/zsh";
  };
}
