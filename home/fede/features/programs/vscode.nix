{ config, inputs, pkgs, ... }:
let
  marketplace-extensions = with inputs.nix-vscode-extensions.extensions.${pkgs.system}.vscode-marketplace; [
    sketchbuch.vsc-workspace-sidebar
    pkief.material-icon-theme
    bbenoist.nix
  ];
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    extensions = with pkgs.vscode-extensions; [
      b4dm4n.vscode-nixpkgs-fmt


      usernamehw.errorlens
      christian-kohler.path-intellisense
      alefragnani.project-manager

    ] ++ marketplace-extensions;

    mutableExtensionsDir = true;

    userSettings = {

      window = {
        menuBarVisibility = "toggle";
        nativeTabs = true;
        titleBarStyle = "native";
      };

      terminal.integrated = {
        cursorBlinking = true;
        cursorStyle = "line";
        fontFamily = "'CaskaydiaCove Nerd Font', monospace";
        smoothScrolling = true;
      };

      nix.serverPath = "${pkgs.nil}/bin/nil";

      /*
      *     $$$$$$$$\       $$\ $$\   $$\                         
      *     $$  _____|      $$ |\__|  $$ |                        
      *     $$ |       $$$$$$$ |$$\ $$$$$$\    $$$$$$\   $$$$$$\  
      *     $$$$$\    $$  __$$ |$$ |\_$$  _|  $$  __$$\ $$  __$$\ 
      *     $$  __|   $$ /  $$ |$$ |  $$ |    $$ /  $$ |$$ |  \__|
      *     $$ |      $$ |  $$ |$$ |  $$ |$$\ $$ |  $$ |$$ |      
      *     $$$$$$$$\ \$$$$$$$ |$$ |  \$$$$  |\$$$$$$  |$$ |      
      *     \________| \_______|\__|   \____/  \______/ \__|      
      */
      editor = {
        acceptSuggestionOnEnter = "smart";
        cursorBlinking = "smooth";
        fontFamily = "'FiraCode Nerd Font', monospace";
        fontLignatures = true;
        fontSize = 15;
        formatOnSave = true;
        lineNumbers = "on";
        minimap.enabled = true;
        renderWhitespace = "all";
        smoothScrolling = true;
        stickyScroll.enabled = true;
        suggestSelection = "first";

        bracketPairColorization = {
          enabled = true;
          independentColorPoolPerBracketType = true;
        };
      };

      /*
      *    $$\      $$\                     $$\       $$\                                     $$\       
      *    $$ | $\  $$ |                    $$ |      $$ |                                    $$ |      
      *    $$ |$$$\ $$ | $$$$$$\   $$$$$$\  $$ |  $$\ $$$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$$\ $$$$$$$\  
      *    $$ $$ $$\$$ |$$  __$$\ $$  __$$\ $$ | $$  |$$  __$$\ $$  __$$\ $$  __$$\ $$  _____|$$  __$$\ 
      *    $$$$  _$$$$ |$$ /  $$ |$$ |  \__|$$$$$$  / $$ |  $$ |$$$$$$$$ |$$ |  $$ |$$ /      $$ |  $$ |
      *    $$$  / \$$$ |$$ |  $$ |$$ |      $$  _$$<  $$ |  $$ |$$   ____|$$ |  $$ |$$ |      $$ |  $$ |
      *    $$  /   \$$ |\$$$$$$  |$$ |      $$ | \$$\ $$$$$$$  |\$$$$$$$\ $$ |  $$ |\$$$$$$$\ $$ |  $$ |
      *    \__/     \__| \______/ \__|      \__|  \__|\_______/  \_______|\__|  \__| \_______|\__|  \__|
      */
      workbench = {
        list.smoothScrolling = true;
        smoothScrolling = true;

        iconTheme = "material-icon-theme";
        colorTheme = "One Dark Pro Darker";
        startupEditor = "none";
        tree = {
          renderIndentGuides = "always";
          indent = 20;
          expandMode = "doubleClick";
        };
      };

      /*
      *     $$$$$$\  $$\   $$\
      *    $$  __$$\ \__|  $$ |
      *    $$ /  \__|$$\ $$$$$$\
      *    $$ |$$$$\ $$ |\_$$  _|
      *    $$ |\_$$ |$$ |  $$ |
      *    $$ |  $$ |$$ |  $$ |$$\
      *    \$$$$$$  |$$ |  \$$$$  |
      *     \______/ \__|   \____/
      */
      git = {
        autofetch = true;
        enableSmartCommit = true;
        confirmSync = false;
        ignoreRebaseWarning = true;
      };

      /*
      *    $$$$$$$\                                                $$\           $$\      $$\
      *    $$  __$$\                                               $$ |          $$$\    $$$ |
      *    $$ |  $$ | $$$$$$\   $$$$$$\  $$\  $$$$$$\   $$$$$$$\ $$$$$$\         $$$$\  $$$$ | $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\   $$$$$$\   $$$$$$\
      *    $$$$$$$  |$$  __$$\ $$  __$$\ \__|$$  __$$\ $$  _____|\_$$  _|        $$\$$\$$ $$ | \____$$\ $$  __$$\  \____$$\ $$  __$$\ $$  __$$\ $$  __$$\
      *    $$  ____/ $$ |  \__|$$ /  $$ |$$\ $$$$$$$$ |$$ /        $$ |          $$ \$$$  $$ | $$$$$$$ |$$ |  $$ | $$$$$$$ |$$ /  $$ |$$$$$$$$ |$$ |  \__|
      *    $$ |      $$ |      $$ |  $$ |$$ |$$   ____|$$ |        $$ |$$\       $$ |\$  /$$ |$$  __$$ |$$ |  $$ |$$  __$$ |$$ |  $$ |$$   ____|$$ |
      *    $$ |      $$ |      \$$$$$$  |$$ |\$$$$$$$\ \$$$$$$$\   \$$$$  |      $$ | \_/ $$ |\$$$$$$$ |$$ |  $$ |\$$$$$$$ |\$$$$$$$ |\$$$$$$$\ $$ |
      *    \__|      \__|       \______/ $$ | \_______| \_______|   \____/       \__|     \__| \_______|\__|  \__| \_______| \____$$ | \_______|\__|
      *                            $$\   $$ |                                                                               $$\   $$ |
      *                            \$$$$$$  |                                                                               \$$$$$$  |
      *                             \______/                                                                                 \______/
      */
      projectManager = {
        git.baseFolders = [
          ""
        ];
        any = {
          maxDepthRecursion = 1;
          baseFolders = [
            ""
          ];
          ignoredFolders = [
            "node_modules"
            "out"
            "typings"
            "test"
          ];
        };
      };

      /*
      *    ⠀$$$$$$\    $$\     $$\
      *    $$  __$$\   $$ |    $$ |
      *   $$ /  $$ |$$$$$$\   $$$$$$$\   $$$$$$\   $$$$$$\
      *   $$ |  $$ |\_$$  _|  $$  __$$\ $$  __$$\ $$  __$$\
      *   $$ |  $$ |  $$ |    $$ |  $$ |$$$$$$$$ |$$ |  \__|
      *   $$ |  $$ |  $$ |$$\ $$ |  $$ |$$   ____|$$ |
      *   ⠀$$$$$$  |  \$$$$  |$$ |  $$ |\$$$$$$$\ $$ |
      *   ⠀\______/    \____/ \__|  \__| \_______|\__|
      *
      * https://patorjk.com/software/taag/#p=display&f=Big%20Money-nw&t=
      */
      material-icon-theme = {
        activeIconPack = "nest";
        hidesExplorerArrows = false;
      };
      security.workspace.trust.enabled = false;

    };
  };
}
