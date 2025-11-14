{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    git-hooks.hooks = {
      trim-trailing-whitespace = {
        enable = true;
        args = [ "--markdown-linebreak-ext=md" ];
      };
      check-docstring-first.enable = true;
      check-merge-conflicts.enable = true;
      check-toml.enable = true;
      check-yaml.enable = true;
      detect-private-keys.enable = true;
      check-added-large-files.enable = true;
      forbid-new-submodules.enable = true;
      name-tests-test = {
        enable = true;
        args = [ "--pytest" ];
      };
      pretty-format-json = {
        enable = true;
        args = [ "--autofix" ];
      };
      isort.enable = true;
      ruff.enable = true;
      ruff-format = {
        enable = true;
        types = [ "file" ];
        types_or = [
          "python"
          "pyi"
          "jupyter"
        ];
      };

    };
  };
}
