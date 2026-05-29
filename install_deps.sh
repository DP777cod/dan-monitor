#!/bin/sh

echo "🔍 בודק חבילות דרושות..."

if ! command -v curl >/dev/null 2>&1; then
    echo "📦 curl לא מותקן. מתקין..."
    apk add --no-cache curl || { echo "❌ נכשל להתקין curl"; exit 1; }
else
    echo "✅ curl מותקן"
fi

if ! command -v jq >/dev/null 2>&1; then
    echo "📦 jq לא מותקן. מתקין..."
    apk add --no-cache jq || { echo "❌ נכשל להתקין jq"; exit 1; }
else
    echo "✅ jq מותקן"
fi

echo "🎉 כל התלויות מותקנות. אתה מוכן להריץ את המערכת."
