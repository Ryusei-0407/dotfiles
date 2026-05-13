#!/bin/sh
#
# Replace the default ABC input source with Google Input (Alphanumeric).
#
# Prerequisites:
#   - Google Japanese Input must be installed
#   - Google Input Alphanumeric must NOT be added via System Settings (to avoid duplicates)
#
# To revert:
#   cp ~/Library/Preferences/com.apple.HIToolbox.plist.bak ~/Library/Preferences/com.apple.HIToolbox.plist
#   Then restart your Mac.

set -e

PLIST="$HOME/Library/Preferences/com.apple.HIToolbox.plist"
PLIST_BUDDY="/usr/libexec/PlistBuddy"
BACKUP="$PLIST.bak"

cp "$PLIST" "$BACKUP"
echo "Backup saved to $BACKUP"

has_abc=false
abc_index=-1
index=0
while $PLIST_BUDDY -c "Print :AppleEnabledInputSources:$index" "$PLIST" >/dev/null 2>&1; do
  name=$($PLIST_BUDDY -c "Print :AppleEnabledInputSources:$index:'KeyboardLayout Name'" "$PLIST" 2>/dev/null || true)
  if [ "$name" = "ABC" ]; then
    has_abc=true
    abc_index=$index
  fi
  index=$((index + 1))
done

if ! $has_abc; then
  echo "ABC input source not found, nothing to do."
  exit 0
fi

$PLIST_BUDDY \
  -c "Add :AppleEnabledInputSources:$index:InputSourceKind string 'Input Mode'" \
  -c "Add :AppleEnabledInputSources:$index:'Bundle ID' string 'com.google.inputmethod.Japanese'" \
  -c "Add :AppleEnabledInputSources:$index:'Input Mode' string 'com.apple.inputmethod.Roman'" \
  "$PLIST"

$PLIST_BUDDY -c "Delete :AppleEnabledInputSources:$abc_index" "$PLIST"

echo "Done. ABC removed, Google Input (Alphanumeric) added."
echo "Restart your Mac to apply changes."
echo "To revert: cp $BACKUP $PLIST"
