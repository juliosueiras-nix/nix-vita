{ lib, stdenv, libelf, zlib, libzip, libyaml, cmake, pkgconfig, fetchFromGitHub, ... }:

stdenv.mkDerivation {
  name = "vita-toolchain";

  buildInputs = [
    cmake
    pkgconfig
    libelf
    zlib
    libzip
    libyaml
  ];

  src = fetchFromGitHub {
    owner = "vitasdk";
    repo = "vita-toolchain";
    rev = "ff4084e26167e072356655570b113b37d28028f2";
    sha256 = "qo31nB94cFkvs7anEdpEH8805U0bV2SAGoJEa10Clqw=";
  };

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
