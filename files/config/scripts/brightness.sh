#!/usr/bin/env bash

# Set the brightness levels
brightnessValues=(1 2 4 7 13 22 37 60 83 100)

usage() {
  cat <<-EOF
Usage: ${0##*/} <increase|decrease>
 
Adjust screen brightness in logarithmic steps for a natural visual experience.

Arguments:
  increase    Raise brightness by one logarithmic step
  decrease    Lower brightness by one logarithmic step

Steps scale (% of max brightness):
  1 → 2 → 4 → 7 → 13 → 22 → 37 → 60 → 83 → 100

Examples:
  ${0##*/} increase
  ${0##*/} decrease

Notes:
  - Brightness is read and set via brightnessctl
  - Each step feels perceptually equal to the human eye
  - Bind to keyboard shortcuts for best experience

EOF
  exit 1
}

# Read the current brightness level
brightness=$(brightnessctl get)
brightnessMax=$(brightnessctl max)
brightnessPercent=$(((brightness * 100) / brightnessMax))

# Find current closest index
closestIndex=0
closestDiff=999
for index in "${!brightnessValues[@]}"; do
  currentDiff=$((${brightnessValues[index]} - brightnessPercent))
  currentDiff=${currentDiff#-}
  if ((currentDiff < closestDiff)); then
    closestIndex=$index
    closestDiff=$currentDiff
  fi
done

# Set new index
newIndex=$closestIndex

# Find new value based on action
case $1 in
increase)
  ((newIndex++))
  ;;
decrease)
  ((newIndex--))
  ;;
*)
  usage
  ;;
esac

# Make sure the new value is within array values
if ((newIndex < 0)); then newIndex=0; fi
if ((newIndex > ${#brightnessValues[@]} - 1)); then newIndex=$((${#brightnessValues[@]} - 1)); fi

newValue=${brightnessValues[newIndex]}

# Set new value
brightnessctl set "$newValue%" >/dev/null

# Send the notification
applicationName="Brightness"
brightnessIcon="preferences-desktop-brightness"
if [ $(pgrep -x -c dunst) -eq 0 ]; then
  dunst &
fi
notify-send -a $applicationName -h string:x-canonical-private-synchronous:brightness "$newValue%" -h int:value:"$newValue" -t 1500 --icon $brightnessIcon -u low
