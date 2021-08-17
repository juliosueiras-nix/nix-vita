{ lib, stdenv, fetchzip, ... }:

let
  EXPAT_VERSION = "2.3.0";
in stdenv.mkDerivation {
  name = "expat";

  src = fetchzip {
    url = "https://github.com/libexpat/libexpat/releases/download/R_2_3_0/expat-${EXPAT_VERSION}.tar.bz2";
    sha256 = "48OldgfjJ6oemKBZdQMprAsawQizmkZk3mQkziqzQGI=";
  };

  configureFlags = [
    "--disable-shared"
  ];

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
