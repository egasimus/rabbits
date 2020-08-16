# Hundred Rabbits on Nix

**TODO** Submit PR to nixpkgs

## Example usage with `configuration.nix`

Clone the repo:

```sh
git clone https://github.com/egasimus/rabbits /etc/nixos/rabbits
```

Import into `configuration.nix`:

```nix
{ pkgs, ... }: let
  # ...
  rabbits = (pkgs.callPackage (import ./rabbits/default.nix) {});
  # ...
in {
  environment.systemPackages = [
    # ...
    rabbits.orca
    rabbits.pilot
    rabbits.marabu
    rabbits.left
    rabbits.ronin
    rabbits.dotgrid
    # ...
  ];
}
```

Rebuild:

```sh
sudo nixos-rebuild switch --fast
```

Launch:

```sh
orca-osc
pilot-osc
marabu
left
ronin
dotgrid
```

Update:

```
cd /etc/nixos/rabbits
git pull
sudo nixos-rebuild switch --fast
```

## Usage with overlays/profiles/flakes/etc.

Left as an exercise to the reader.
