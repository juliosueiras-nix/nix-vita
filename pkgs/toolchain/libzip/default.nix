{ stdenv, buildScripts, fetchFromGitHub, cmake, zlib, ... }:

stdenv.mkDerivation {
  name = "libzip";

  buildInputs = [
    cmake
  ];

  src = fetchFromGitHub {
    owner = "vitasdk";
    repo = "libzip";
    rev = "33fb70457b5dc6a6c95387b0b12d873696419878";
    sha256 = "gHVay+LDujkUqzzNSuLPL/DuKljAamNjd2oAgq3G++U=";
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
