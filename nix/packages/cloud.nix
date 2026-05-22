{ pkgs }:
with pkgs; [
  ### AWS ###
  awscli2

  ### AZURE ###
  azurite
  azure-cli
  azure-functions-core-tools
]
