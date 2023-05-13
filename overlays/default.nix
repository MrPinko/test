{ outputs, inputs }:
{

  # Modifies existing packages
  modifications = (self: super: {
    awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
  
    # discord = super.discord.overrideAttrs (
    #   _: { src = builtins.fetchTarball {
    #     url = "https://discord.com/api/download?platform=linux&format=tar.gz";
    #     sha256 = "1z980p3zmwmy29cdz2v8c36ywrybr7saw8n0w7wlb74m63zb9gpi";
    #   };}
    # );
  });

}
