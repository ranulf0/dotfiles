#!/usr/bin/env bash

DIR="$HOME/.config/wallpapers/"
DEFAULT_WALL="$DIR/wallpaper"

selection=$(
    find "$DIR" -type f \
        \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.webp' \) \
        -print0 |
    while IFS= read -r -d '' file; do
        printf '%s\0icon\x1f%s\n' \
            "$(basename "$file")" "$file"
    done |
    rofi -dmenu -show-icons \
        -p "Wallpaper / #HEX" \
        -theme-str '
    window {
        width: 800px;
    }

    listview {
        columns: 3;
        lines: 2;
        layout: vertical;
    }

    element {
        orientation: vertical;
    }

    element-icon {
        size: 200px;
    }

    element-text {
        horizontal-align: 0.5;
    }
'
) || exit

[ -z "$selection" ] && exit

if [[ "$selection" =~ ^#[0-9A-Fa-f]{6}$ ]]; then
    APPLY_WALL="/tmp/wallpaper-color.png"

    magick -size 64x64 "xc:$selection" "$APPLY_WALL" || exit 1

    cp -f -- "$APPLY_WALL" "$DEFAULT_WALL"
else
    APPLY_WALL="$DIR/$selection"

    [ -f "$APPLY_WALL" ] || exit 1

    cp -f -- "$APPLY_WALL" "$DEFAULT_WALL"
fi

while IFS= read -r monitor; do
    hyprctl hyprpaper wallpaper "$monitor,$APPLY_WALL,cover"
done < <(
    hyprctl monitors -j | jq -r '.[].name'
)
