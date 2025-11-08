{
  home.sessionVariables = {
    DBT_PROJECT_DIR = "$HOME/khanflow-pipelines/dbt-khanflow";
  };

  programs.zsh.shellAliases = {
    dbtenv = ". ~/.venv/dbt_next/bin/activate";
  };

  programs.ghostty.settings = {
    working-directory = "/Users/rosslovelace/khanflow-pipelines/dbt-khanflow";
  };
}
