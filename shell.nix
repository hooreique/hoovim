{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = [
    pkgs.lua-language-server
    pkgs.nil
  ];

  shellHook = "export SHELL='/bin/zsh'";
}
