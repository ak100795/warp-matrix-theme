# Matrix — Warp Custom Theme

A green-on-black ["Matrix"](https://en.wikipedia.org/wiki/The_Matrix) custom theme
for the [Warp](https://www.warp.dev) terminal.

## Features

- Glowing green-on-black palette inspired by the film's "digital rain"
- Standard Warp theme format — pick it from the theme picker like any other theme
- No background image, so it renders consistently regardless of your wallpaper

## Palette

| Field | Value |
| --- | --- |
| Name | `Matrix` |
| Accent | `#00ff41` |
| Cursor | `#00ff41` |
| Background | `#0a0a0a` |
| Foreground | `#00ff41` |
| Details | `darker` |

The full 16-color ANSI palette (bright + normal) is defined in `Matrix.yaml`.

## Installation

### Option 1 — install script (recommended)

The included `install-matrix.sh` detects your OS, resolves the correct Warp
themes directory, creates it if needed, backs up any existing `Matrix.yaml`,
installs the theme, and validates the YAML against Warp's schema.

```zsh
git clone https://github.com/ak100795/warp-matrix-theme.git
cd warp-matrix-theme
./install-matrix.sh
```

To install from a theme file elsewhere:

```zsh
./install-matrix.sh /path/to/Matrix.yaml
```

### Option 2 — manual

Place `Matrix.yaml` into the theme directory for your operating system:

- macOS: `~/.warp/themes/`
- Linux: `${XDG_DATA_HOME:-$HOME/.local/share}/warp-terminal/themes/`
- Windows: `$env:APPDATA\warp\Warp\data\themes\`

## Using the theme

1. Warp may take a few minutes (or a restart) to first discover a themes directory.
   After that, changes are reflected within seconds.
2. Open **Settings** → **Appearance**.
3. In the **Custom Themes** box, select **Matrix**.
4. Press the checkmark to apply (or the ✗ to revert).

You can also switch quickly from the Command Palette (**⌘⇧P** on macOS,
**Ctrl⇧P** on Windows/Linux) and searching "Open Theme Picker".

## Uninstalling

Delete `Matrix.yaml` from your themes directory (paths listed above), then close
and reopen the theme picker. Warp falls back to your previously selected theme.

## Files

- `Matrix.yaml` — the theme definition
- `install-matrix.sh` — cross-platform install/backup/verify helper
- `LICENSE` — MIT license

## License

[MIT](LICENSE) © 2026 Mohamed Adel Khodeir
