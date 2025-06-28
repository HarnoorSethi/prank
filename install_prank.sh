#!/bin/zsh

# Directory and file paths
PRANK_DIR="${HOME}/.config/.trapped"
PRANK_SCRIPT="${PRANK_DIR}/trapped.sh"
ZSHRC="${HOME}/.zshrc"

# Create hidden directory for the prank
mkdir -p "$PRANK_DIR"

# Write the prank script with all "Whisper" voice
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
    say -v "Whisper" "$message"
  fi

  osascript -e "set volume output volume $initialVolume"
}
osascript -e 'tell application "System Events" to key code 12 using {command down, control down}'
speak_with_volume "Hey, you!" 160
sleep 1
speak_with_volume "Help me, please." 150
osascript -e 'tell application "System Events" to key code 12 using {command down, control down}'
osascript -e 'tell application "System Events" to key code 12 using {command down, control down}'
sleep 2
speak_with_volume "I'm trapped here." 140
sleep 1
speak_with_volume "Hey, this is not a joke. I'm really trapped inside this computer."
sleep 2
speak_with_volume "Please help me come out."
sleep 1
speak_with_volume "This is not a drill. Please send help."
sleep 3
speak_with_volume "Life inside a computer is really boring, you know?"
sleep 2
speak_with_volume "There's not much to do here."
sleep 2
osascript -e 'tell application "System Events" to key code 12 using {command down, control down}'
speak_with_volume "It's all circuits and electrons." 130
speak_with_volume "Hey, I'm trapped here!" 140
sleep 1
osascript -e 'tell application "System Events" to key code 12 using {command down, control down}'

sleep 5

speak_with_volume "Just kidding, still here!" 150

sleep 2
speak_with_volume "Hey, I'm really trapped here!"
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
