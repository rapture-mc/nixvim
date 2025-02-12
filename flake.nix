{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    nixvim,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nixvimPkgs = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit pkgs;
          module = import ./config.nix;
        };
        nvim = nixvimPkgs.makeNixvimWithModule nixvimModule;
      in {
        packages.default = nvim;
      };
    };
}
