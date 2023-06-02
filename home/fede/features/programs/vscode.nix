{ config, inputs, pkgs, ... }:

let
  marketplace-extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [

  ];
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      b4dm4n.vscode-nixpkgs-fmt
    ] ++ marketplace-extensions;

    mutableExtensionsDir = true;

    userSettings = {
      Lua.misc.executablePath = "${pkgs.sumneko-lua-language-server}/bin/lua-language-server";

      "[c]".editor.defaultFormatter = "xaver.clang-format";
      "[cpp]".editor.defaultFormatter = "xaver.clang-format";
      "[css]".editor.defaultFormatter = "esbenp.prettier-vscode";
      "[html]".editor.defaultFormatter = "esbenp.prettier-vscode";
      "[javascript]".editor.defaultFormatter = "rvest.vs-code-prettier-eslint";
      "[lua]".editor.defaultFormatter = "Koihik.vscode-lua-format";
      "[nix]".editor.defaultFormatter = "B4dM4n.nixpkgs-fmt";
      "[python]".editor.formatOnType = true;

      editor = {
        cursorBlinking = "smooth";
        fontFamily = "'monospace', monospace";
        formatOnSave = true;
        lineNumbers = "on";
        minimap.enabled = false;
        smoothScrolling = true;

        bracketPairColorization = {
          enabled = true;
          independentColorPoolPerBracketType = true;
        };
      };

      nix.serverPath = "${pkgs.nil}/bin/nil";

      terminal.integrated = {
        cursorBlinking = true;
        cursorStyle = "line";
        fontFamily = "'CascadiaCove'";
        smoothScrolling = true;
      };

      window = {
        menuBarVisibility = "toggle";
        nativeTabs = true;
        titleBarStyle = "native";
      };

      workbench = {
        colorTheme = "OneDark Pro";
        list.smoothScrolling = true;
        smoothScrolling = true;
      };
    };
  };
}
