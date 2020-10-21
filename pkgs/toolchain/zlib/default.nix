{ stdenv, buildScripts, cmake, ... }:

let
  ZLIB_VERSION = "1.2.11";
in stdenv.mkDerivation {
  name = "zlib";

  buildInputs = [
    cmake
  ];

  src = fetchTree {
    type = "tarball";
    url = "http://downloads.sourceforge.net/project/libpng/zlib/${ZLIB_VERSION}/zlib-${ZLIB_VERSION}.tar.xz";
    narHash = "sha256-AQIoy96jcdmKs/F4GVqDFXxcZ7c66GF+yalHg3ALEyU=";
  };

  patches = [
    ("${buildScripts}/patches/zlib.patch")
  ];

  postInstall = ''
    rm $out/lib/libz.so
    rm $out/lib/libz.so.1
  '';

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
