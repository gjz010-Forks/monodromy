{
  lib,
  stdenv,
  fetchurl,
  gmp,
}:

stdenv.mkDerivation {
  pname = "lrs";
  version = "7.3";

  src = fetchurl {
    url = "http://cgm.cs.mcgill.ca/~avis/C/lrslib/archive/lrslib-073.tar.gz";
    sha256 = "sha256-xJpOvYVhg0c9HVpieF/N/hBX1dZx1LlvOhJQ6xr+ToM=";
  };

  patches = [ ./mingw32_and_musl_static_build.patch ];
  buildInputs = [ gmp ];

  makeFlags = [
    "prefix=${placeholder "out"}"
    "CC:=$(CC)"
  ];

  meta = {
    description = "Implementation of the reverse search algorithm for vertex enumeration/convex hull problems";
    license = lib.licenses.gpl2;
    maintainers = [ lib.maintainers.raskin ];
    platforms = with lib.platforms; (linux ++ windows);
    homepage = "http://cgm.cs.mcgill.ca/~avis/C/lrs.html";
  };
}
