{pkgs}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    # Some basic stuff
    bash
    coreutils
    findutils
    gnumake

    # Linter, formatter, and alike
    treefmt # One tool to format them all
    nixd # Nix language Server
    nil # Nix language Server, I use both because Zed expect both
    alejandra # Nix formatter
    shellcheck
    shfmt
  ];
}
