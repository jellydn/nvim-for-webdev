# Guide for Using NVIM_APPNAME for Neovim

## Prerequisites

- Ensure you have Neovim installed or use [MordechaiHadad/bob: A version manager for neovim](https://github.com/MordechaiHadad/bob)

## Steps

### 1. Clone the Configuration

Clone the Neovim configuration for web development (or any other purpose).

```bash
git clone https://github.com/jellydn/nvim-for-webdev.git ~/.config/nvim_webdev
```

### 2. Set NVIM_APPNAME Environment Variable

Change the `NVIM_APPNAME` environment variable to the name of the Neovim application.

```bash
NVIM_APPNAME=nvim_webdev nvim
```

Otherwise, use alias:

```bash
alias web_nvim="NVIM_APPNAME=nvim_webdev nvim"
```

This will start Neovim with the configuration stored in `~/.config/nvim_webdev`.

## Resources

- [Neovim Configuration - Practicalli Neovim](https://practical.li/neovim/configuration/#multiple-configurations)
- [mehalter/zsh-nvim-appname: A simple ZSH plugin for maintaining multiple Neovim configurations with NVIM_APPNAME](https://github.com/mehalter/zsh-nvim-appname)
