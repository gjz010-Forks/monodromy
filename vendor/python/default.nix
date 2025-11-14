{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    languages.python = {
      enable = true;
      venv.enable = true;
      package = pkgs.python310;
      uv = {
        enable = true;
        sync = {
          enable = true;
        };
      };
    };
    env = {
      VIRTUAL_ENV = config.env.DEVENV_ROOT + "/.devenv/state/venv";
      PYTHONPATH = config.env.DEVENV_ROOT;
      MYPYPATH = config.env.DEVENV_ROOT;
      # so C extensions can find dyamically linked libraries
      # https://github.com/cachix/devenv/issues/1264
      # https://github.com/cachix/devenv/issues/1228
      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath (
        let
          xorg = pkgs.xorg;
        in
        [
          pkgs.stdenv.cc.cc.lib
          pkgs.zstd
          pkgs.zlib
          pkgs.libGL
          xorg.libX11
          xorg.libxcb
          xorg.libXcomposite
          xorg.libXext
          pkgs.libxkbcommon
          xorg.libXrender
          pkgs.zlib
          xorg.xcbutilimage
          xorg.xcbutilkeysyms
          xorg.libXfixes
          xorg.libXtst
          pkgs.fontconfig
          pkgs.freetype
          pkgs.gtk3
          pkgs.gdk-pixbuf
          pkgs.glib
          pkgs.pango
          pkgs.dbus
        ]
      );
    };
  };

}
