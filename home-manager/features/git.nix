{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "MrPinko";
    userEmail = "77388947+MrPinko@users.noreply.github.com";

    aliases = {
      st = "status -sb";
      ds = "diff --stat";
      undo = "reset --hard HEAD~1";
      patch = "format-patch --stdout HEAD~1";
      rank = "shortlog -s -n --no-merges";
      lg = "log --graph --decorate --all --oneline";
      ll = "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr %an)%Creset' --abbrev-commit --date=relative";
      unstage = "reset HEAD --";
      quick-rebase = "rebase --interactive --autostash --committer-date-is-author-date";
    };
    extraConfig = {
      safe.directory = [
        # "/home/iab/nsworld"
        # "/home/iab/devel/nixpkgs"
      ];
    };
  };

  programs.git.delta = {
    enable = true;
  };

  # Git Large File Storage
  programs.git.lfs = {
    enable = true;
  };

  programs.gh = {
    enable = true;
  };

  # programs.lazygit = {
  #   enable = true;
  # };

#   programs.jujutsu = {
#     enable = true;
#     settings = {
#       user = {
#         name = "zendo";
#         email = "linzway@qq.com";
#       };
#     };
#   };

  programs.ssh = {
    enable = true;
  };
}
