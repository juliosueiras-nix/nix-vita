{ lib, stdenv, gmp, mpfr, fetchzip, ... }:

let
  MPC_VERSION = "1.1.0";
in stdenv.mkDerivation {
  name = "mpc";

  src = fetchzip {
    url = "mirror://gnu/mpc/mpc-${MPC_VERSION}.tar.gz";
    sha256 = "kqIRJvZjtZet9Qs5Bod7x4Ikw10QArAl+OGojbOGhaQ=";
  };

  configureFlags = [
    "--with-gmp=${gmp}"
    "--with-mpfr=${mpfr}"
    "--disable-shared"
    "--disable-nls"
  ];

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
