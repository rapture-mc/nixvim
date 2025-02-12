{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = {nixpkgs, nixvim, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    nvim = nixvimPkgs.makeNixvimWithModule nixvimModule;
    nixvimPkgs = nixvim.legacyPackages.${system};
    nixvimModule = {
      inherit pkgs;
      module = import ./config.nix;
    };
  in {
    packages.${system}.default = nvim;
  };
}
