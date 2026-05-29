#!/bin/sh

LOG_FILE="./logs/dan.log"
HONEYPOT="./.hidden_trigger"

mkdir -p "$(dirname $LOG_FILE)"
touch "$HONEYPOT"

monitor_loop() {
  echo "[+] Monitoring started..." >> "$LOG_FILE"
  while true; do
    if [ -f "$HONEYPOT" ]; then
      echo "[!] Honeypot accessed: $(date)" >> "$LOG_FILE"
      curl -s -X POST "https://api.telegram.org/bot$(jq -r .telegram_token config.json)/sendMessage" \
        -d chat_id="$(jq -r .telegram_chat_id config.json)" \
        -d text="📡 ALERT: Honeypot triggered at $(date)"
      rm -f "$HONEYPOT"
      touch "$HONEYPOT"
    fi
    sleep 1
  done
}

case "$1" in
  start) monitor_loop ;;
  simulate_event)
    echo "simulating access" >> "$HONEYPOT"
    ;;
  *)
    echo "Usage: $0 {start|simulate_event}"
    ;;
esac
