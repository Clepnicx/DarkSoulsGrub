{
  description = "Flake to manage DS-Grub theme";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    with nixpkgs.lib;
    {
      nixosModule =
        { config, ... }:
        let
          cfg = config.boot.loader.grub.ds-grub-theme;

          ds-grub-theme = pkgs.stdenv.mkDerivation {
            name = "ds-grub-theme";
            src = "${self}";
            installPhase = ''
              mkdir -p $out/icons
              cp -r icons/* $out/icons

              cp *.png $out
              cp theme.txt $out
              cp *.pf2 $out
              cp background.jpg $out
            '';
          };
        in
        {
          options = {
            boot.loader.grub.milk-theme = {
              enable = mkOption {
                type = types.bool;
                default = false;
                example = true;
                description = ''
                  Enable DS-Grub theme
                '';
              };
            };
          };

          config = mkIf cfg.enable {
            environment.systemPackages = [ milk-grub-theme ];

            boot.loader.grub = {
              theme = "${milk-grub-theme}";
              splashImage = "${milk-grub-theme}/background.jpg";
            };
          };
        };
    };
}
