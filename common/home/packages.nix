{ pkgs, ... }:
{
  home.packages = with pkgs; [
    delta
    fd
    nil # Nix language server
    nixd # Nix language server
    ripgrep
    uv
  ];
}
