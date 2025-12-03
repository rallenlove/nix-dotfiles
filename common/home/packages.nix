{ pkgs, ... }:
{
  home.packages = with pkgs; [
    delta
    fd
    markdown-oxide
    nil # Nix language server
    nixd # Nix language server
    python3
    ripgrep
    uv
  ];
}
