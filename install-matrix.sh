#!/usr/bin/env bash
#
# install-matrix.sh — install, back up, and verify the Matrix Warp theme.
#
# Usage:  ./install-matrix.sh  [path-to-Matrix.yaml]
#   default source: same directory as this script / Matrix.yaml
#
# Works on macOS, Linux, and Windows (Git Bash / WSL).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="${1:-$SCRIPT_DIR/Matrix.yaml}"

# If no plain Matrix.yaml exists, fall back to the most recent versioned backup.
if [[ ! -f "$SRC" ]]; then
  LATEST="$(ls -t "$SCRIPT_DIR"/Matrix-*.yaml 2>/dev/null | head -1)"
  SRC="${LATEST:-$SRC}"
fi

if [[ ! -f "$SRC" ]]; then
  echo "error: theme file not found: $SRC" >&2
  echo "place Matrix.yaml here or pass a path: $0 /path/to/Matrix.yaml" >&2
  exit 1
fi

# --- Resolve the Warp themes directory for the current OS ---------------------
case "$(uname -s)" in
  Darwin)
    THEMES_DIR="$HOME/.warp/themes"
    ;;
  Linux)
    THEMES_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/warp-terminal/themes"
    ;;
  MINGW*|MSYS*|CYGWIN*)
    THEMES_DIR="${APPDATA}\\warp\\Warp\\data\\themes"
    ;;
  *)
    echo "error: unsupported OS: $(uname -s)" >&2
    exit 1
    ;;
esac

mkdir -p "$THEMES_DIR"
DEST="$THEMES_DIR/Matrix.yaml"

# --- Back up an existing installed copy, if present ---------------------------
if [[ -f "$DEST" ]]; then
  BK="$HOME/warp-theme-backups/Matrix-existing-$(date +%Y%m%d-%H%M%S).yaml"
  mkdir -p "$HOME/warp-theme-backups"
  cp "$DEST" "$BK"
  echo "backed up existing theme -> $BK"
fi

# --- Install ------------------------------------------------------------------
cp "$SRC" "$DEST"
echo "installed -> $DEST"

# --- Validate the YAML against the Warp theme schema ---------------------------
if command -v python3 >/dev/null 2>&1; then
  python3 - "$DEST" <<'PY'
import sys
import yaml

path = sys.argv[1]
d = yaml.safe_load(open(path))
req = {'name', 'accent', 'cursor', 'background', 'foreground', 'details', 'terminal_colors'}
col = {'black', 'blue', 'cyan', 'green', 'magenta', 'red', 'white', 'yellow'}
assert req == set(d), f"top-level keys mismatch: {set(d) ^ req}"
assert set(d['terminal_colors']) == {'bright', 'normal'}, "terminal_colors must have bright+normal"
assert all(set(d['terminal_colors'][g]) == col for g in ('bright', 'normal')), "missing ANSI color"
assert 'background_image' not in d, "background_image must be excluded"
print("schema OK")
PY
else
  echo "warning: python3 not found — skipped schema validation"
fi

echo "done. Restart Warp (or refresh the theme picker), then select 'Matrix' in Settings -> Appearance."