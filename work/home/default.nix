{ pkgs, ... }:
{
  home.sessionVariables = {
    DBT_PROJECT_DIR = "$HOME/khanflow-pipelines/dbt-khanflow";
  };

  programs.zsh = {
    shellAliases = {
      dbtenv = ". ~/.venv/dbt_next/bin/activate";
    };
    plugins = [
      {
        name = "dbt-completion";
        completions = [ "_dbt" ];
        src = pkgs.fetchFromGitHub {
          owner = "dbt-labs";
          repo = "dbt-completion.bash";
          rev = "HEAD";
          sha256 = "sha256-QTm3PXj0AB5wSNvHjHNiFeFJ28DaDQ615+VYkZr9iQw=";
        };
      }
    ];
  };

  programs.ghostty.settings = {
    working-directory = "/Users/rosslovelace/khanflow-pipelines/dbt-khanflow";
  };
}
