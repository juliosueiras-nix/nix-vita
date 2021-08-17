{ stdenv, buildScripts, autoreconfHook, ... }:

let
  LIBELF_VERSION = "0.8.13";
in stdenv.mkDerivation {
  name = "libelf";

  buildInputs = [
    autoreconfHook
  ];

  src = fetchTree {
    type = "tarball";
    url = "https://github.com/vitasdk/artifacts/releases/download/libelf-${LIBELF_VERSION}/libelf-${LIBELF_VERSION}.tar.gz";
    narHash = "sha256-i39QjqiRopt/Tk69AAHURSY4QhVKxrQjbpXgLZJYlHg=";
  };

  configureFlags = [
    "--disable-shared"
    "--disable-nls"
  ];

  patchPhase = ''
    patch -p3 < ${buildScripts}/patches/libelf.patch
  '';

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
