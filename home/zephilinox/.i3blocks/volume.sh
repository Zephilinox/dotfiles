VAL="$( amixer get Master | grep -F "Front Left:" | cut -d ' ' -f 9)"

if [ "$VAL" == "[on]" ]
then
	VAL='['$(mpc volume | cut -d ':' -f 2 | cut -d ' ' -f 2)']'
fi

echo $VAL
