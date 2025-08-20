# Dark Souls Grub Theme

![Showcase](./preview.jpg)

### 🛠️ Installation

```bash
git clone https://github.com/Clepnicx/DarkSoulsGrub.git
sudo ./DarkSoulsGrub/install.sh
```

### ❄ NixOS
```nix
# flake.nix
{
  inputs.ds-grub-theme.url = "github:Clepnicx/DarkSoulsGrub";

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        # ...
        inputs.ds-grub-theme.nixosModule
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

## O!
