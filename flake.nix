{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    banyan.url = "github:srid/banyan";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, flake-compat, banyan, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      defaultApp.${system} = self.apps.${system}.live;
      apps."${system}" = {
        live = rec {
          type = "app";
          # '' is required for escaping ${} in nix
          script = pkgs.writers.writeBash "liveReload.sh" ''
            set -xe
            export PORT="''${BANYAN_PORT:-7071}"
            ${banyan.defaultPackage.${system}}/bin/banyan run --port $PORT
          '';
          program = builtins.toString script;
        };
      };
    };
}
