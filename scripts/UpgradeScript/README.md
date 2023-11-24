# Upgrade Tool V1.1

A command-line tool written in Go for upgrading the system and Flatpak packages on Arch Linux.

## Usage

The tool can be executed by running the compiled binary file or by running the Go code directly.

The tool takes optional command-line arguments that will be passed to the underlying package manager commands.

The following command-line arguments are recognized:

- `noconfirm`: bypass confirmation prompts.
- `not-yay`: use `sudo pacman -Syu` instead of `yay` to upgrade the system.
- `system`: only upgrade the system packages.
- `flatpak`: only upgrade the Flatpak packages.

## Example

```bash
# Upgrade the system and Flatpak packages with confirmation prompts
./upgrade

# Upgrade the system and Flatpak packages without confirmation prompts
./upgrade noconfirm

# Upgrade only the system packages
./upgrade system

# Upgrade only the Flatpak packages
./upgrade flatpak

# Upgrade the system packages using 'sudo pacman -Syu'
./upgrade not-yay
```