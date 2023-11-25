#!/bin/bash

# Mouse sensitivity adjustment
touchpad_name="Virtual core pointer"
touchpad_sensitivity=4

xinput --set-prop "$touchpad_name" "Coordinate Transformation Matrix" "$touchpad_sensitivity" 0 0 0 "$touchpad_sensitivity" 0 0 0 1
