{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
