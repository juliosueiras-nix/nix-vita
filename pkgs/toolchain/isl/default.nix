{ lib, stdenv, gmp, fetchzip, ... }:

let
  ISL_VERSION = "0.21";
in stdenv.mkDerivation {
  name = "isl";

  src = fetchzip {
    url = "http://isl.gforge.inria.fr/isl-${ISL_VERSION}.tar.xz";
    sha256 = "JjP9hSJ8Nhqjs9mRHBHC63Ap3VAWWF2ClqqRyQfuUhg=";
  };

  configureFlags = [
    "--with-gmp-prefix=${gmp}"
    "--disable-shared"
  ];

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
