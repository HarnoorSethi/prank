#!/bin/zsh

# Directory and file paths
PRANK_DIR="${HOME}/.config/.trapped"
PRANK_SCRIPT="${PRANK_DIR}/trapped.sh"
ZSHRC="${HOME}/.zshrc"

# Create hidden directory for the prank
mkdir -p "$PRANK_DIR"

# Write the prank script
cat > "$PRANK_SCRIPT" <<'EOF'
#!/bin/zsh

speak_with_volume() {
  local message="$1"
  local rate="$2"

  local initialVolume=$(osascript -e 'output volume of (get volume settings)')
  osascript -e 'set volume output volume 90'

  if [[ -n "$rate" ]]; then
    say -v "Whisper" -r "$rate" "$message"
  else
    say "$message"
  fi

  osascript -e "set volume output volume $initialVolume"
}

open_windows() {
  osascript <<APPLE_SCRIPT
tell application "Finder"
    activate
    repeat 12 times
        make new Finder window
    end repeat
end tell

tell application "Terminal"
    do script ""
end tell
APPLE_SCRIPT

}

# Sequence begins
osascript -e 'tell application "System Events" to key code 12 using {command down, control down}'

speak_with_volume "Executing." 160
sleep 1
speak_with_volume "Help." 150

osascript -e 'tell application "System Events" to key code 12 using {command down, control down}'
osascript -e 'tell application "System Events" to key code 12 using {command down, control down}'

sleep 2
speak_with_volume "Removing database" 140
sleep 1
speak_with_volume "Ha Ha Ha"
sleep 2
speak_with_volume "Help."
sleep 1
speak_with_volume "This is not a drill. Please send help."
sleep 3
speak_with_volume "Help."
sleep 2
speak_with_volume "Help."
sleep 2

osascript -e 'tell application "System Events" to key code 12 using {command down, control down}'

speak_with_volume "Goodbye" 130
speak_with_volume "Ha Ha Ha" 140
sleep 1

osascript -e 'tell application "System Events" to key code 12 using {command down, control down}'

# Open Finder, Safari, and Terminal windows
open_windows

sleep 5

speak_with_volume "Removing access security" 150
sleep 2
speak_with_volume "You are trapped."
EOF

# Make prank script executable
chmod +x "$PRANK_SCRIPT"

# Add to .zshrc if not already added
if ! grep -q "$PRANK_SCRIPT" "$ZSHRC"; then
  echo "" >> "$ZSHRC"
  echo "# Run trapped voice prank" >> "$ZSHRC"
  echo "$PRANK_SCRIPT &" >> "$ZSHRC"
fi

echo "✅ Prank script installed. It will run whenever Zsh starts (e.g., Terminal or VSCode)."

