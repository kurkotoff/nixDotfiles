
{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./modules/programs/installs.nix
    ./modules/programs/zsh.nix
    ./modules/programs/git.nix
    ./modules/programs/vscode.nix
    ./modules/programs/neovim.nix
  ];
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "kurkotoff";
    homeDirectory = "/home/kurkotoff";
  };

  home.stateVersion = "21.05";
}
