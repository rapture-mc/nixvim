## Installation

### Add Nixvim to Flake inputs
```
{
 inputs = {
    nixvim.url = "github:rapture-mc/nixvim";
 };
}
```

### Add Flake input package to system packages
```
{
  outputs = { nixpkgs, ... }@inputs: let
    lib = nixpkgs.legacyPackages.x86_64-linux;
  in {
    nixosConfigurations.nixos = lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [
        {
          environment.systemPackages = [ inputs.nixvim.packages.x86_64-linux.default ];
        }
      ];
    };
  };
}
```
