{ lib, stdenv, m4, fetchzip, ... }:

let
  GMP_VERSION = "6.1.2";
in stdenv.mkDerivation {
  name = "gmp";

  buildInputs = [
    m4
  ];

  CPPFLAGS = "-fexceptions";

  src = fetchzip {
    url = "mirror://gnu/gmp/gmp-${GMP_VERSION}.tar.bz2";
    sha256 = "ZbJMQvSXkFFeZM/Kvq+/qaDeSd4WPSFQiQkvphROtJc=";
  };

  configureFlags = [
    "--enable-cxx"
    "--disable-shared"
  ];

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
