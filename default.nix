# All credits go towards https://dzfrias.dev/blog/deploy-rust-cross-platform-github-actions/
{ pkgs ? import <nixpkgs> { } }:
let manifest = (pkgs.lib.importTOML ./Cargo.toml).package;
in
pkgs.rustPlatform.buildRustPackage rec {
  pname = manifest.name;
  version = manifest.version;
  cargoLock = {
	  lockFile = ./Cargo.lock;
	  outputHashes = {
		  "sulphur_core-0.1.0" = "sha256-wATDUaMnahOVvquX08hDXNj3lHDOk/+vD9d3NZYwnxg=";
	  };
  };
  src = pkgs.lib.cleanSource ./.;
}
