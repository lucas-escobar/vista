#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="src"
DIST_DIR="dist"
MAIN_FILE="$SRC_DIR/_index.scss"

# Ensure dist directory exists
mkdir -p "$DIST_DIR"

echo "Building Vista Sass..."

# 1. Generate a single combined SCSS file (optional, mostly for Sass users)
cat \
    "$SRC_DIR/_reset.scss" \
    "$SRC_DIR/_tokens.scss" \
    "$SRC_DIR/_colors.scss" \
    "$SRC_DIR/_typography.scss" \
    "$SRC_DIR/_themes.scss" \
    "$SRC_DIR/_syntax-highlighting.scss" \
    "$SRC_DIR/_util.scss" \
    > \
    "$DIST_DIR/vista.scss" #"$SRC_DIR/_index.scss" \
#cat "$SRC_DIR"/_*.scss >"$DIST_DIR/vista.scss"
echo "  -> $DIST_DIR/vista.scss"

# 2. Compile to human-readable CSS
sass "$MAIN_FILE" "$DIST_DIR/vista.css"
echo "  -> $DIST_DIR/vista.css"

# 3. Compile to minified CSS
sass --style=compressed "$MAIN_FILE" "$DIST_DIR/vista.min.css"
echo "  -> $DIST_DIR/vista.min.css"

echo "Build complete!"
