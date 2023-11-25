#!/bin/bash

xmodmap -e "remove Lock = Caps_Lock"         # Remove Caps Lock function
xmodmap -e "keysym Caps_Lock = Control_L"    # Remap Caps Lock to Left Control
xmodmap -e "add Control = Control_L"         # Add Left Control function to newly mapped Caps Lock

echo "Caps Lock remapped to additional Left Control key"
