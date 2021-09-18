{config, pkgs, ... }:

{
  programs.zsh = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        update = "sudo nixos-rebuild switch";
      };

      history = {
        size = 1000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      
      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
      };
    };
}