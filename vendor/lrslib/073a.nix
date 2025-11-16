{
  lib,
  stdenv,
  fetchurl,
  gmp,
}:

stdenv.mkDerivation {
  pname = "lrs";
  version = "7.3a";

  src = fetchurl {
    url = "https://cgm.cs.mcgill.ca/~avis/C/lrslib/archive/lrslib-073a.tar.gz";
    sha256 = "sha256-f7Fq1cK3OA743q7L+vU1me7wdP0iUBKqQxt27gve1qY=";
  };

  patches = [ ./mingw32_and_musl_static_build.patch ];
  buildInputs = [ gmp ];

  makeFlags = [
    "prefix=${placeholder "out"}"
    "CC:=$(CC)"
  ];

  postFixup = ''
    for dll in $out/bin/*.dll; do
      orig=$(readlink -f $dll)
      rm $dll
      cp $orig $dll
    done
  '';

  meta = {
    description = "Implementation of the reverse search algorithm for vertex enumeration/convex hull problems";
    license = lib.licenses.gpl2;
    maintainers = [ lib.maintainers.raskin ];
    platforms = with lib.platforms; (linux ++ windows);
    homepage = "http://cgm.cs.mcgill.ca/~avis/C/lrs.html";
  };
}
