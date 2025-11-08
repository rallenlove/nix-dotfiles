{ pkgs, ... }:
{
  home.packages = with pkgs; [
    delta
    fd
    fzf
    nil
    nixd
    pure-prompt
    ripgrep
    uv
    yazi
  ];
}
