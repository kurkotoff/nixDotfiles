{config, pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    
    #Extra configuration
    extraConfig = 
    ''
    set splitbelow
    set number
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    '';

    #Packages available for nvim
    extraPackages = [
      pkgs.clang
      pkgs.python310
    ];
    
    #Packages for plugins and stuff
    extraPython3Packages = (ps: with ps; [
      jedi
      yapf
      pynvim
    ]);

    #Plugins
    plugins = with pkgs.vimPlugins; [
      jedi-vim
      deoplete-jedi
      {
        plugin = deoplete-nvim;
        config = "let g:deoplete#enable_at_startup = 1";
      }
      {
        plugin = vim-airline-themes;
        config = "let g:airline_theme='dracula'";
      }
      auto-pairs
      nerdcommenter
      {
        plugin = neoformat;
        config = 
''
let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1        
'';
    }
      {
        plugin = jedi-vim;
        config = 
        ''
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
        '';
      
      }
      nerdtree
      vim-nix
      vim-highlightedyank
      SimpylFold
      wal-vim
    ];

    withPython3 = true;
  };
}