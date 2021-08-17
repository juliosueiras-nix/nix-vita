{ lib, stdenv, texinfo, buildScripts, fetchzip, ... }:

let
  BINUTILS_VERSION = "2.34";
in stdenv.mkDerivation {
  name = "binutils";

  buildInputs = [
    texinfo
  ];

  src = fetchzip {
    url = "mirror://gnu/binutils/binutils-${BINUTILS_VERSION}.tar.xz";
    sha256 = "eEB4Qe841bjLIE2soNCu+SFq/UD7rcJT+Dw66tMs69Q=";
  };

  patchPhase = ''
    patch -p3 < ${buildScripts}/patches/binutils/0001-vita.patch
    patch -p1 < ${buildScripts}/patches/binutils/0002-fix-broken-reloc.patch
    patch -p3 < ${buildScripts}/patches/binutils/0003-fix-elf-vaddr.patch
  '';

  configureFlags = [
    "--target=arm-vita-eabi"
    "--disable-nls"
    "--disable-werror"
    "--disable-separate-code"
    "--enable-interwork"
    "--enable-plugins"
  ];

  dontDisableStatic = true;
  dontStrip = true;
  dontPatchELF = true;
  hardeningDisable = [ "all" ];
}
