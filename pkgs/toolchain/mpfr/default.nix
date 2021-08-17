{ lib, stdenv, gmp, fetchzip, ... }:

let
  MPFR_VERSION = "4.0.2";
in stdenv.mkDerivation {
  name = "mpfr";

  src = fetchzip {
    url = "mirror://gnu/mpfr/mpfr-${MPFR_VERSION}.tar.bz2";
    sha256 = "j6TZau/sNyREH2rw6NCagLfwdAqmVPG3BkhDirk6fEk=";
  };

  configureFlags = [
    "--with-gmp=${gmp}"
    "--disable-shared"
  ];

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
