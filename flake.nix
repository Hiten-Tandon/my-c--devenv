{
  description =
    "A Nix flake with a C++ environment for data science and visualization";

  inputs = {
    nixpkgs.url =
      "github:NixOS/nixpkgs/nixos-unstable"; # Adjust this to the desired version
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { system = system; };
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            libgcc
            pkg-config
            gnumake
            cmake
            clang-tools
            libclang
            conan
          ];
          shellHook = "";
        };
      });
}

