{
  description = "Vita Toolchain";

  inputs.nixpkgs.url =
    "github:NixOS/nixpkgs/469f14ef0fade3ae4c07e4977638fdf3afc29e08";

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
    };
}
