<h1 align="center">Welcome to nvim-for-webdev 👋</h1>
<p>
Are you a web developer working with JS, Typescript, React, and Tailwind CSS? Check out the Neovim and LazyVim plugin starter template!
</p>

## Starter Template for Web Developers

This is a starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

Find detailed resources for each plugin in the accompanying readme. Start your web development journey with Neovim and LazyVim today!

## Install Neovim

The easy way is using [MordechaiHadad/bob: A version manager for neovim](https://github.com/MordechaiHadad/bob).

```sh
bob install stable
bob use stable
```

## Install the config

Make sure to remove or move your current `nvim` directory

```sh
git clone https://github.com/jellydn/nvim-for-webdev.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

## Extra plugins from LazyVim

Add below plugins to [lazy.lua](./lua/config/lazy.lua)
```lua
    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
```


## [Keymaps](./lua/config/keymaps.lua)

- Add custom mappings for quickly exiting insert mode, closing buffers, opening the Alpha dashboard, displaying NullLs info, and toggling certain features of the Gitsigns and Todo Comments plugins.


## UI
### Dashboard

![dashboards](dashboard.png)

### Folding

- Add [UFO folding and hover to preview](./lua/plugins/2-folding.lua)


## Setup [IDE](./lua/plugins/1-coding.lua)

This IDE setup includes several plugins for Neovim that provide features such as autocompletion, documentation generation, and formatting. The setup includes the Codeium plugin, which is a competitor to GitHub Copilot, as well as the Tabnine autocompletion plugin. Additionally, the setup includes the vim-jsdoc plugin for generating documentation, and plugins for sorting Tailwind CSS classes using Rustywind and null-ls.nvim.

### Resources

- https://codeium.com/compare/comparison-copilot-codeium
- https://github.com/Exafunction/codeium.vim
- https://www.tabnine.com/blog/tabnine-vs-github-copilot/
- https://github.com/tzachar/tabnine-vim
- https://github.com/codota/tabnine-nvim
- https://github.com/heavenshell/vim-jsdoc
- https://github.com/avencera/rustywind

## Show your support

Give a ⭐️ if this project helped you!
