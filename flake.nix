{
  description = "A compartmentalized operating system";

  inputs.nixpkgs.url =
    "git+https://spectrum-os.org/git/nixpkgs/?h=wayland&ref=wayland";

  inputs.flake-utils = {
    url = "github:numtide/flake-utils";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        # To use library you must provide your nixpkgs;
        lib = import ./.;
      });
}
