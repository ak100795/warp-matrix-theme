# Matrix — Warp Custom Theme

A green-on-black "Matrix" theme for the [Warp](https://www.warp.dev) terminal.

## Details

| Field | Value |
| --- | --- |
| Name | Matrix |
| Accent | `#00ff41` |
| Cursor | `#00ff41` |
| Background | `#0a0a0a` |
| Foreground | `#00ff41` |
| Details | darker |

The full 16-color `terminal_colors` palette (bright + normal sets) is defined in
`Matrix.yaml`. There is no `background_image`.

## Files in this folder

- `install-matrix.sh` — cross-platform install/backup/verify script (primary install
  method).
- `Matrix-20260817-210435.yaml` — versioned backup of the theme (byte-identical to the
  installed copy at creation time).
- `README.md` — this file.

## Installation (recommended)

Run the included script from this folder. It detects your OS, resolves the correct
Warp themes directory, creates it if needed, backs up any existing `Matrix.yaml`,
installs the theme, and validates the YAML against the Warp schema.

```zsh
~/warp-theme-backups/install-matrix.sh
```

To install from a different source file:

```zsh
~/warp-theme-backups/install-matrix.sh /path/to/Matrix.yaml
```

After running it, open **Settings** → **Appearance** and select **Matrix** in the
**Custom Themes** box. Warp may take a few minutes (or a restart) to first discover
the themes directory; afterward, changes are reflected within seconds.

## Manual installation

If you prefer to install by hand, place `Matrix.yaml` into the themes directory for
your operating system:

- macOS: `~/.warp/themes/`
- Linux: `${XDG_DATA_HOME:-$HOME/.local/share}/warp-terminal/themes/`
- Windows: `$env:APPDATA\warp\Warp\data\themes\`

Then select **Matrix** in **Settings** → **Appearance**.

## Restore (macOS)

```zsh
cp "$HOME/warp-theme-backups/Matrix-20260817-210435.yaml" "$HOME/.warp/themes/Matrix.yaml"
```

## Author / provenance

Original file path: `~/.warp/themes/Matrix.yaml`