{ stdenv, buildScripts, cmake, zlib, ... }:

stdenv.mkDerivation {
  name = "libzip";

  buildInputs = [
    cmake
  ];

  src = fetchTree {
    type = "git";
    url = "https://github.com/vitasdk/libzip";
    rev = "33fb70457b5dc6a6c95387b0b12d873696419878";
  };

  cmakeFlags = [
    "-DZLIB_INCLUDE_DIR=${zlib}/include"
    "-DZLIB_LIBRARY=${zlib}/lib/libz.a"
  ];

  patchPhase = ''
    patch -p3 < ${buildScripts}/patches/libzip.patch
  '';

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
