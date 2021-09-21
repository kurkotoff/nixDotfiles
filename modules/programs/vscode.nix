{config, pkgs, ...}:

{
  programs.vscode = {
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        bbenoist.Nix
        ms-python.python
        ms-vscode.cpptools
      ];
  };
}