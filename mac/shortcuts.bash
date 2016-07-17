ARCHIVE_FILE=$HOME/.mac-shortcuts

local -a domains
domains[${#domains[@]}]=com.google.Chrome
domains[${#domains[@]}]=com.apple.itunes
domains[${#domains[@]}]=com.apple.finder
domains[${#domains[@]}]=com.apple.notes
domains[${#domains[@]}]=com.microsoft.word
domains[${#domains[@]}]=com.bittorrent.uttorent.notes


function loadMacShortcuts() {
	local file=$1

	if [ ! -f $file ]; then
		2>&1 echo "file not found"
		return 1;
	fi


}

function saveMacShortcuts() {

}


# Reads all the
defaults read com.google.Chrome NSUserKeyEquivalents
