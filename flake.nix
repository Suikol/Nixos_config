{
  description = "Suikol's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    catppuccin = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  outputs =
    {
      self,
      home-manager,
      nixpkgs,
      catppuccin,
      nur,
      nix-cachyos-kernel,
      ...
    }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./system/configuration.nix

          {
            nixpkgs.overlays = [
              nix-cachyos-kernel.overlays.pinned
            ];
          }

          nur.modules.nixos.default

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = inputs;
            home-manager.users.suikol = {
              imports = [
                ./home-manager/home-manager.nix
                catppuccin.homeModules.catppuccin
              ];
            };
          }
        ];
      };
    };
}
