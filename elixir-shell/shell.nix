with (import <unstable> {});
  mkShell {
    buildInputs =
      [
        # Basic stuff
        bash
        coreutils
        findutils
        gnumake

        # Nix
        nixd # Language Server
        nil # Language Server, I use both because Zed kindoff expect both
        alejandra # Formatter

        # Elixir
        elixir
        elixir-ls
      ]
      ++ optional stdenv.isLinux libnotify # For ExUnit Notifier on Linux.
      ++ optional stdenv.isLinux inotify-tools # For file_system on Linux.
      ++ optional stdenv.isDarwin terminal-notifier # For ExUnit Notifier on macOS.
      ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
        # For file_system on macOS.
        CoreFoundation
        CoreServices
      ]);
  }
