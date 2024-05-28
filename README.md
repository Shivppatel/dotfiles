# dotfiles
![image](https://github.com/Shivppatel/dotfiles/assets/42050563/591e5e2e-5265-4574-a2de-5c32d63d57e1)

This repository houses my custom configurations for the following software applications:
1. [Alacritty](https://github.com/alacritty/alacritty) - Rust-built, cross-platform, OpenGL terminal emulator.
3. [Neovim](https://github.com/neovim/neovim) - Vim-fork focused on extensibility and usability.
4. [Sketchybar](https://github.com/FelixKratz/SketchyBar) - Highly customizable macOS status bar replacement
5. [Skhd](https://github.com/edwardtj/skhd) - Simple hotkey daemon for macOS
6. [Starship](https://github.com/starship/starship) - The minimal, blazing-fast, and infinitely customizable prompt for any shell!
7. [Tmux](https://github.com/tmux/tmux) - Versatile terminal multiplexer
8. [Yabai](https://github.com/koekeishiya/yabai) - Tiling window manager for macOS based on binary space partitioning
9. [Wezterm](https://github.com/wez/wezterm) - A GPU-accelerated cross-platform terminal emulator and multiplexer

### Start commands
```bash
skdh --start-service
yabai --start-service
brew services start sketchybar
```

### Stop commands
```bash
skdh --stop-service
yabai --stop-service
brew services stop sketchybar
```

### Restart commands
```bash
skhd --restart-service
yabai --restart-service
sketchybar --reload
```

### Symlink locations (macOS)
```bash
~/.tmux.conf
~/.wezterm.lua
~/.confg/alacritty/
~/.confg/nvim/
~/.confg/sketchybar/
~/.confg/skhd/
~/.config/starship/
~/.confg/yabai/
```
