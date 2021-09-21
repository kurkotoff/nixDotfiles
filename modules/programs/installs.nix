{config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    vscode
    brave
    vivaldi
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
    (lib.lowPrio neovim)
    wget
    protonvpn-gui
    ripgrep
    fd
    coreutils
    clang
    emacs
    unzip
    clang-tools
    sddm
  ];
}
