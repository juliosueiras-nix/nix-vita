{ callPackage, ... }:

let
  buildScripts = fetchTree {
    type = "git";
    url = "https://github.com/vitasdk/buildscripts";
    rev = "8e16fc172d71aeff9e2445cb08819d57d261293d";
  };
in rec {
  zlib = callPackage ./zlib { inherit buildScripts; };
  libzip = callPackage ./libzip { inherit zlib buildScripts; };
  libelf = callPackage ./libelf { inherit buildScripts; };
  libyaml = callPackage ./libyaml {};
  gmp = callPackage ./gmp {};
  mpfr = callPackage ./mpfr {
    inherit gmp;
  };

  mpc = callPackage ./mpc {
    inherit gmp mpfr;
  };

  isl = callPackage ./isl {
    inherit gmp;
  };
  
  expat = callPackage ./expat {};
  vita-toolchain = callPackage ./vita-toolchain {
    inherit libelf zlib libzip libyaml;
  };

  binutils = callPackage ./binutils {
    inherit buildScripts;
  };
}
