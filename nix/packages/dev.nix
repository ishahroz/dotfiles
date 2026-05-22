{ pkgs }:
with pkgs; [
  ### PYTHON ###
  uv

  ### GO LANGUAGE ###
  go

  ### JUST ###
  just
  just-lsp

  ### NIX ###
  nil
  nixfmt

  ### NODE AND NPM ###
  nodejs_24
  pnpm

  ### INFRA ####
  terraform
]
