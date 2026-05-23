{ pkgs }:
with pkgs;
[
  ### AWS ###
  awscli2

  ### AZURE ###
  azurite
  azure-cli
]
++ lib.optionals (stdenv.hostPlatform.system != "aarch64-linux") [
  azure-functions-core-tools
]
