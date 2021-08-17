{ lib, stdenv, fetchzip, ... }:

let
  LIBYAML_VERSION = "0.2.2";
in stdenv.mkDerivation {
  name = "libyaml";

  src = fetchzip {
    url = "http://pyyaml.org/download/libyaml/yaml-${LIBYAML_VERSION}.tar.gz";
    sha256 = "pplLq0s21ujV0I4TU9mzkXjTWimXRFDGKaFHQQiNHqU=";
  };

  configureFlags = [
    "--disable-shared"
    "--enable-static"
    "CFLAGS=-DYAML_DECLARE_STATIC"
  ];

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
