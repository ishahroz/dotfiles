# Nix Home Manager

This flake is a shared Home Manager setup for Linux environments, including WSL
and native/VM Linux. It supports both common 64-bit Linux architectures.

## Supported targets

| Environment | Architecture | Flake output |
| --- | --- | --- |
| WSL on Intel/AMD Windows | `x86_64-linux` | `ishahroz-x86_64-linux` |
| Native/VM Linux on Intel/AMD | `x86_64-linux` | `ishahroz-x86_64-linux` |
| WSL on ARM64 Windows | `aarch64-linux` | `ishahroz-aarch64-linux` |
| Native/VM Linux on ARM64 | `aarch64-linux` | `ishahroz-aarch64-linux` |

## Usage

Run the output that matches the Linux architecture:

```sh
home-manager switch --flake ~/dotfiles/nix#ishahroz-x86_64-linux
home-manager switch --flake ~/dotfiles/nix#ishahroz-aarch64-linux
```

After Home Manager is installed, the `hma` shell helper detects the current
architecture and runs the matching output automatically.

## User and home path

The Linux username is defined once in `flake.nix` as `ishahroz`. The home path
is derived from it as `/home/ishahroz`.

Create WSL/native Linux users with the same username to keep this config
portable.

## Package availability

The config is shared across WSL and native Linux. Most packages should work on
both `x86_64-linux` and `aarch64-linux`, but package availability is still
decided by nixpkgs per architecture.

If a package fails only on ARM64 or only on x86_64, keep the main config shared
and guard just that package with an architecture condition.
