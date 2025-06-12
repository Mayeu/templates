{
  description = "Mayeu's templates";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShell = import ./shell.nix {inherit pkgs;};
    })
    // {
      templates = {
        envsh = {
          path = ./envsh;
          description = "The env.sh / env.local.sh template I use in most project";
        };

        elixir-shell = {
          path = ./elixir-shell;
          description = "Non-flake Elixir shell, for quick elixir hack on project where you won't be able to commit the flake.";
          welcomeText = "This template assume that you have an <unstable> channel defined.";
        };
      };
    };
}
