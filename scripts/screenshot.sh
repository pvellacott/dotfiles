#!/bin/bash

img_path="$HOME/Pictures/Screenshots/screenshot-$(date +%s).png"

grim -g "$(slurp)" "$img_path" && swappy -f "$img_path"

