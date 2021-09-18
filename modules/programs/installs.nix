{config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    vscode
    brave
    yakuake
    lutris
    git
    tdesktop
    thunderbird
    qbittorrent
    wine
    libreoffice
    whatsapp-for-linux
    glib-networking
    gimp
    neovim
    wget
  ];
}
