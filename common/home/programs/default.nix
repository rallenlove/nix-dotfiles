{ config, pkgs, ... }:
{
  imports = [
    ./starship
    ./zellij
  ];

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    defaultKeymap = "viins";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases.dr = "sudo -H darwin-rebuild switch --flake .";
    plugins = [
      {
        name = "zsh-autoswitch-virtualenv";
        file = "autoswitch_virtualenv.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "MichaelAquilina";
          repo = "zsh-autoswitch-virtualenv";
          rev = "HEAD";
          sha256 = "sha256-jzeJYxoO8kXRexfRpG71YKO0RpwYHlagvkRVCnZ7UkQ=";
        };
      }
    ];
  };

  programs.ghostty = {
    enable = true;
    package = null;
    enableZshIntegration = true;
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

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

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

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
}
