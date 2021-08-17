{
  description = "Vita Toolchain";

  inputs.nixpkgs.url =
    "github:NixOS/nixpkgs/3b6c3bee9174dfe56fd0e586449457467abe7116";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = { allowUnfree = true; };
      };
    in {
      packages.x86_64-linux = import ./pkgs/toolchain/all-packages.nix {
        inherit (pkgs) callPackage;
      };

      hydraJobs = {
        default = self.packages.x86_64-linux;
      };

      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = [
          self.packages.x86_64-linux.libelf
          pkgs.pkgconfig
        ];
      };
    };
}
