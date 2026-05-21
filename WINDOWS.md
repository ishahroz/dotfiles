# Windows Setup

The following guide was tested on Windows 11 Pro, and `Ubuntu-24.04` was the WSL distro.

## Pre-requisite

### WSL and Ubuntu

1. Open `PowerShell` in **administrator** mode by right-clicking and selecting `Run as administrator`.
2. Run the following command to install WSL without installing a distribution:

```powershell
wsl --install --no-distribution
```
3. Install `Ubuntu-24.04` as the Linux distribution:

```powershell
wsl --install -d Ubuntu-24.04
```

### Terminal

1. Make sure [`Windows Terminal`](https://github.com/microsoft/terminal) is installed on your Windows OS.
2. Open Windows Terminal settings and set the following values:
  - on the `Startup` page, set:
    - Default Profile = `Ubuntu-24.04`
    - Default Terminal application = `Windows Terminal`
    - Launch parameters = `Launch mode = Maximized`
3. Click on "Save" and restart the Terminal.

### Scoop

[`Scoop`](https://scoop.sh/) is a command-line installer for Windows.

1. Open `PowerShell` and run the following command:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
2. Run the following command to invoke the Scoop installer:

```powershell
irm get.scoop.sh | iex
```

If you get an error like this, `Running the installer as administrator is disabled by default...`, run the following command instead:

```powershell
iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
```

3. Verify the installation by running: `scoop --version`.

### Install Git using Scoop

1. Open `PowerShell` and run the following command:

```powershell
scoop bucket add main
scoop install main/git
```

2. Verify the installation by running: `git --version`.

## Windows Setup

1. Open `Powershell` and clone this `dotfiles` repository in the user directory:

```powershell
git clone https://github.com/ishahroz/dotfiles.git

cd dotfiles
```

2. Run the `windows-setup` script:

```powershell
.\scripts\windows-setup.ps1
```

3. Open Windows Terminal settings and click on "Open JSON File" in the bottom left corner:
  - Copy [`gruvbox_dark.json`](./ms-terminal/gruvbox_dark.json) and paste in the `schemes` array.
  - Click on "Save".
  - Go to your profile settings (e.g: `Ubuntu-24.04`) and set color scheme to "Gruvbox Dark".
  - Set cursor shape to "Bar", font size to "18" and font face to "ZedMono Nerd Font" (after clicking on "Show all fonts").
  - Click on "Save".
