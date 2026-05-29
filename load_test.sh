#!/bin/sh

echo "🚀 מריץ בדיקת עומס... (300 ניסיונות)"

TRIGGER_FILE="honeypot_trigger.txt"
COUNT=300

for i in $(seq 1 $COUNT); do
    echo "Attempt $i at $(date)" >> "$TRIGGER_FILE"
    sleep 0.1
done

echo "✅ הסתיימה בדיקת עומס עם $COUNT ניסיונות כתיבה ל־$TRIGGER_FILE"
