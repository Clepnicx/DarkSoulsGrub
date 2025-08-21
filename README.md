# Dark Souls Grub Theme

![Showcase](./preview.jpg)

## 🛠️ Installation

```bash
git clone https://github.com/Clepnicx/DarkSoulsGrub.git
sudo ./DarkSoulsGrub/install.sh
```

## ❄ NixOS

### Flake

```nix

# flake.nix
{
  inputs.ds-grub-theme.url = "github:Clepnicx/DarkSoulsGrub";

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        # ...
        inputs.ds-grub-theme.nixosModules.default
      ];
    };
  };
}

# configuration.nix
{
  boot.loader.grub = {
    enable = true;
    gfxmodeEfi = "1920x1080"; # set your resolution
    gfxpayloadEfi = "keep";
    ds-grub-theme.enable = true;
  };
}
```

### Package

```nix

# configuration.nix
{ config, lib,  pkgs, ... }:

let
  ds-grub-theme = pkgs.fetchFromGitHub
  {
    owner = "Clepnicx";
    repo = "DarkSoulsGrub";
    rev = "35adfbf17757f2ddf8218321b6f38d9aa7de9292";
    sha256 = "sha256-RNN/1kNRgUxCIChOSCj/yypa/ZjH+t/O8qXp1II9oL4=";
  };
in

{
boot.loader.grub = {
  enable = true;
  gfxmodeEfi = "1920x1080"; # set your resolution
  gfxpayloadEfi = "keep";
  theme = ds-grub-theme;
}
```

Note: the rev and thus sha256 are hard coded for a specific version. In order to
use the latest version (rn, the hardcoded is the latest one), use
```nix-prefetch-git``` to know about it.

```shell
nix-shell -p nix-prefetch-git --command "nix-prefetch-git https://github.com/Clepnicx/DarkSoulsGrub.git"
```

Then fill up the required data.

## References

Code reference: <https://github.com/gemakfy/MilkGrub>

Background: <https://www.reddit.com/r/darksouls/comments/ytoyk8/i_made_an_8k_firelink_shrine_wallpaper/>

Inspiration: <https://github.com/PedroMMarinho/grubsouls-theme>

Icons: <https://github.com/Kahmul/DarkSoulsIcons>
