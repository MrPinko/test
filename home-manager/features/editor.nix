{ pkgs, nixosConfig, ... }:
{
  
  home.packages = if nixosConfig.services.xserver.enable then with pkgs; [
    #package to install only with xserver enabled
    vscode 
  ] else [];

  programs.helix = {
    enable = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      LazyVim
      neogit
      vim-nix
      vim-lsp
      vim-markdown
      editorconfig-vim
      (nvim-treesitter.withPlugins (
        plugins: with plugins; [
          tree-sitter-markdown
          tree-sitter-nix
        ]
      ))
    ];
  };

}
