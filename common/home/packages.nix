{ pkgs, ... }:
{
  home.packages = with pkgs; [
    delta
    fd
    fzf
    helix
    lazygit
    nil
    nixd
    pure-prompt
    ripgrep
    uv
    yazi
  ];
}
