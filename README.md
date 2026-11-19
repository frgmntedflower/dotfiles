# Neovim C/C++ Development Environment

A lightweight, modular and portable Neovim configuration focused on C and C++ development. Built with Lua and [lazy.nvim](https://github.com/folke/lazy.nvim), using Neovim's native LSP support.

The goal is to provide a complete development environment without unnecessary complexity or distro-specific configuration.

## Features

- **LSP:** C/C++ language support through `clangd`
- **Completion:** `nvim-cmp` with LuaSnip
- **Formatting:** Conform.nvim with `clang-format`
- **Debugging:** `nvim-dap` with CodeLLDB
- **Syntax highlighting:** Treesitter
- **File navigation:** Telescope and mini.files
- **Git integration:** Gitsigns
- **UI:** Catppuccin Mocha, mini.statusline and which-key
- **Snippets:** Custom C++ snippets
- **Plugin management:** lazy.nvim with a committed lockfile

## Requirements

### Core requirements

- Linux
- Neovim 0.11 or newer
- Git
- A C/C++ compiler
- `clangd`
- `clang-format`

### Recommended development tools

| Tool | Purpose |
|---|---|
| GCC / G++ | GNU compiler |
| Clang / Clang++ | LLVM compiler |
| clangd | C/C++ language server |
| clang-format | Code formatting |
| CMake | Build system |
| Ninja | Build tool |
| GDB | GNU debugger |
| CodeLLDB | LLDB debugging adapter |
| ripgrep | Telescope live grep |
| fd | Fast file discovery |
| make | Build plugin dependencies |
| curl | Downloading tools |

The configuration is Linux distribution independent. Install these dependencies using the package manager or installation method appropriate for your distribution.

## Installation

### 1. Install Neovim

Install Neovim 0.11 or newer.

One distribution-independent option is to use the official release archive.

Example for x86-64 Linux:

```bash
mkdir -p ~/.local/opt ~/.local/bin

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

tar -xzf nvim-linux-x86_64.tar.gz -C ~/.local/opt

ln -sfn ~/.local/opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim
```

Add `~/.local/bin` to your PATH if necessary:

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
source ~/.profile
```

Verify:

```bash
nvim --version
```

For ARM64 or other architectures, download the corresponding release asset from the [Neovim releases page](https://github.com/neovim/neovim/releases).

### 2. Install development dependencies

Install Git, a compiler, clangd, clang-format and any additional tools you need.

For a basic C++ setup, make sure these commands are available:

```bash
git --version
clangd --version
clang-format --version
g++ --version
cmake --version
```

Optional formatters:

- `stylua` for Lua
- `black` for Python

### 3. Clone the repository

```bash
mkdir -p ~/projects

git clone <YOUR_GITHUB_REPOSITORY_URL> ~/projects/dotfiles

cd ~/projects/dotfiles
```

### 4. Link the Neovim configuration

Neovim looks for its configuration at:

```text
~/.config/nvim
```

Link the repository configuration:

```bash
mkdir -p ~/.config

ln -s ~/projects/dotfiles/nvim ~/.config/nvim
```

If `~/.config/nvim` already exists, back it up before creating the symlink.

### 5. Start Neovim

```bash
nvim
```

On first launch, the configuration automatically bootstraps lazy.nvim and installs the declared plugins.

Wait for plugin installation to finish, then restart Neovim.

Useful commands:

```vim
:Lazy
:checkhealth
:checkhealth vim.lsp
```

## CodeLLDB setup

The debugger configuration uses CodeLLDB through `nvim-dap`.

The adapter must be available as an executable named `codelldb` on your PATH.

Verify:

```bash
command -v codelldb
codelldb --help
```

If downloading CodeLLDB as a VS Code `.vsix` extension, remember that a VSIX is a ZIP archive.

Inspect its contents:

```bash
unzip -l codelldb.vsix
```

Extract it:

```bash
mkdir -p ~/.local/opt/codelldb
unzip codelldb.vsix -d ~/.local/opt/codelldb
```

Locate the platform-specific adapter executable, make it executable and add its directory to PATH.

The exact executable location depends on the extension release and architecture.

## Repository structure

```text
dotfiles/
├── LICENSE
├── README.md
└── nvim/
    ├── init.lua
    ├── lazy-lock.json
    └── lua/
        ├── core/
        │   ├── autocmds.lua
        │   ├── keymaps.lua
        │   └── options.lua
        └── plugins/
            ├── colorscheme.lua
            ├── completion.lua
            ├── dap.lua
            ├── formatting.lua
            ├── git.lua
            ├── lsp.lua
            ├── snippets.lua
            ├── telescope.lua
            ├── treesitter.lua
            └── ui.lua
```

## Keybindings

The leader key is **Space**.

### General

| Keybinding | Description |
|---|---|
| `Space w` | Save file |
| `Space q` | Quit |
| `Space Q` | Force quit all |
| `Esc` | Clear search highlighting |
| `Space tt` | Open terminal |
| `Esc Esc` (terminal mode) | Exit terminal mode |
| `Space co` | Open quickfix |
| `Space cc` | Close quickfix |
| `Space cn` | Next quickfix item |
| `Space cp` | Previous quickfix item |

### Window management

| Keybinding | Description |
|---|---|
| `Space sv` | Vertical split |
| `Space sh` | Horizontal split |
| `Ctrl+h` | Move to left window |
| `Ctrl+j` | Move to lower window |
| `Ctrl+k` | Move to upper window |
| `Ctrl+l` | Move to right window |

### Line movement

| Keybinding | Description |
|---|---|
| `Alt+j` | Move line down |
| `Alt+k` | Move line up |
| `Alt+j` (visual mode) | Move selected lines down |
| `Alt+k` (visual mode) | Move selected lines up |

### File navigation and search

| Keybinding | Description |
|---|---|
| `Space e` | Open mini.files |
| `Space ff` | Find files |
| `Space fg` | Search text using live grep |
| `Space fb` | Find open buffers |
| `Space fh` | Search help tags |
| `Space fs` | Search document symbols |
| `Space fS` | Search workspace symbols |
| `Space fr` | Find recent files |

Live grep requires ripgrep (`rg`).

### Diagnostics and LSP

| Keybinding | Description |
|---|---|
| `Space d` | Show diagnostics for current line |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |

The configuration enables clangd for C and C++.

### Formatting

| Keybinding | Description |
|---|---|
| `Space fm` | Format current buffer |

Formatting is also enabled automatically on save.

Configured formatters:

| Filetype | Formatter |
|---|---|
| C | clang-format |
| C++ | clang-format |
| Lua | stylua |
| Python | black |

### Git

| Keybinding | Description |
|---|---|
| `Space hp` | Preview Git hunk |
| `Space hs` | Stage Git hunk |
| `Space hr` | Reset Git hunk |
| `Space hb` | Blame current line |

### Debugging

| Keybinding | Description |
|---|---|
| `F5` | Start / continue debugging |
| `F10` | Step over |
| `F11` | Step into |
| `F12` | Step out |
| `Space db` | Toggle breakpoint |
| `Space dB` | Set conditional breakpoint |
| `Space du` | Toggle debugger UI |

The debugger prompts for an executable path when launching a program. The default starting directory is `build/debug/`.

Compile your C/C++ program with debug symbols, for example using `-g`.

### Completion

| Keybinding | Description |
|---|---|
| `Ctrl+Space` | Trigger completion |
| `Enter` | Confirm completion |
| `Tab` | Next completion item / expand snippet |
| `Shift+Tab` | Previous completion item / reverse snippet jump |

### C++ snippets

The configuration includes the following LuaSnip snippets:

| Trigger | Description |
|---|---|
| `main` | Basic C++ main function |
| `class` | Basic C++ class declaration |
| `fori` | Integer-based for loop |

## C++ project example

A simple CMake project can look like this:

```text
example/
├── CMakeLists.txt
├── src/
│   └── main.cpp
└── build/
```

Example `CMakeLists.txt`:

```cmake
cmake_minimum_required(VERSION 3.20)

project(Example
    VERSION 1.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(example
    src/main.cpp
)
```

Configure and build:

```bash
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug
cmake --build build
```

The generated `compile_commands.json` helps clangd understand your project's compiler flags and include paths.

## Updating plugins

Open Neovim and run:

```vim
:Lazy sync
```

The plugin versions are recorded in `nvim/lazy-lock.json`.

Commit changes to the lockfile when intentionally updating plugins:

```bash
git
