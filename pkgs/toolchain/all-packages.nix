{ callPackage, ... }:

let
  buildScripts = fetchTree {
    type = "git";
    url = "https://github.com/vitasdk/buildscripts";
    rev = "53c9a64e598da4ace88797154750eab51af58ecf";
  };
in rec {
  zlib = callPackage ./zlib { inherit buildScripts; };
  libzip = callPackage ./libzip { inherit zlib buildScripts; };
  libelf = callPackage ./libelf { inherit buildScripts; };
}
