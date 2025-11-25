{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
  ];
  # programs.zsh = {
  #   dotDir = "${config.xdg.configHome}/zsh";

  #   # Source system profile for macOS paths
  #   profileExtra = ''
  #     # Ensure system paths are loaded
  #     if [ -x /usr/libexec/path_helper ]; then
  #       eval "$(/usr/libexec/path_helper -s)"
  #     fi
  #   '';

  # Ensure Homebrew is in PATH
  # envExtra = ''
  #   # Homebrew
  #   if [[ -f "/opt/homebrew/bin/brew" ]]; then
  #     eval "$(/opt/homebrew/bin/brew shellenv)"
  #   fi
  # '';
  # };
}
