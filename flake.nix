{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/4c1880fae5bdc3048fc7e0f044c1a8e1bf7fb48a;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = import nixpkgs {
          system = system;
        }; in
        {
          devShell = import ./shell.nix { inherit pkgs; };
          defaultPackage = import ./default.nix { inherit pkgs; };
        }
      );
}
