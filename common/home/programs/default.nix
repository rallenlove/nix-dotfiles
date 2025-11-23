{ lib, ... }:
{
  imports = [
    ./zellij
  ];

  programs.zsh = {
    enable = true;
    initContent =
      let
        pure = lib.mkOrder 500 "prompt pure";
      in
      lib.mkMerge [ pure ];
  };

  programs.ghostty = {
    enable = true;
    package = null;
  };
  programs.ghostty.settings = {
    theme = "iTerm2 Solarized Dark";
    macos-option-as-alt = true;
    maximize = 1;
    keybind = [
      "alt+arrow_left=unbind"
      "alt+arrow_right=unbind"
    ];
  };

  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "solarized_dark";
      editor = {
        trim-trailing-whitespace = true;
        whitespace.render.tab = "all";
      };
    };
  };
  programs.helix.languages.language = [
    {
      name = "sql";
      auto-format = true;
      formatter = {
        command = "sqlfluff";
        args = [
          "format"
          "--templater"
          "jinja"
          "--config"
          "/Users/rosslovelace/.sqlfluff"
          "-"
        ];
      };
    }
  ];

  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        paging = {
          pager = builtins.concatStringsSep " " [
            "delta"
            "--dark"
            "--paging=never"
            "--line-numbers"
            "--hyperlinks"
            ''--hyperlinks-file-link-format="lazygit-edit://{path}:{line}"''
          ];
        };
        # pagers = [
        #   {
        #     pager = builtins.concatStringsSep " " [
        #       ...
        #     ];
        #   }
        # ];
      };
      gui.nerdFontsVersion = "3";
    };
  };
}
