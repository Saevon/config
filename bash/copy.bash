copy() {
	if [[ $1 =~ ^-([hH?]|-help) ]]; then
		echo "Copies stdin or any given args to the clipboard"
		echo
		echo "Usage: copy [text]"
		echo "  or pipe a command: [command] | copy"
		return
	fi

	local output
	local res=false
	local tmpfile="${TMPDIR}/copy.$RANDOM.txt"
	local msg=""

	if [[ $# == 0 ]]; then
		pbcopy
	else
		echo -ne "$@" | pbcopy
	fi
}
