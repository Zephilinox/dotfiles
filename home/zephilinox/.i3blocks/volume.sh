#Get the master output, see if muted. [on] or [off]
VAL="$( amixer get Master | grep -F "Front Left:" | cut -d ' ' -f 9)"

if [ "$VAL" == "[on]" ]
then
	PAUSED="$( mpc | grep -F "[paused]" )"
        
	if [ "$PAUSED" != "" ] #empty if not paused
	then
		VAL="[paused"]
	else
		VAL='['$(mpc volume | cut -d ':' -f 2 | cut -d ' ' -f 2)']'

		if [ "$VAL" == "[]" ] #vol under 10, so different cut pos
		then
			VAL='['$(mpc volume | cut -d ':' -f 2 | cut -d ' ' -f 3)']'
		fi
	fi
else
	VAL="[muted]"
fi

echo $VAL
