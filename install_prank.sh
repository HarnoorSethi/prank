cat > "$PRANK_SCRIPT" <<'EOF'
#!/bin/zsh

speak_with_volume() {
  local message="$1"
  local rate="$2"

  local initialVolume=$(osascript -e 'output volume of (get volume settings)')
  osascript -e 'set volume output volume 90'

  if [[ -n "$rate" ]]; then
    say -r "$rate" "$message"
  else
    say "$message"
  fi

  osascript -e "set volume output volume $initialVolume"
}

# PART 1: Speech and key presses
part1() {
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

  sleep 5

  speak_with_volume "Removing access security" 150

  sleep 2
  speak_with_volume "You are trapped."
}

# PART 2: Finder windows and Safari open
part2() {
  osascript -e '
  tell application "Finder"
      activate
      repeat 2 times
          make new Finder window
      end repeat
  end tell
  '

  speak_with_volume "Opening some windows for you." 150
  sleep 2



}

# Run both parts in parallel
part1 & 
part2 &

# Wait for both background jobs to finish before exiting script
wait
EOF
