if [[ "$0 $@" == *" --help"* || "$0 $@" == *" -h"* ]]; then
    echo "Usage: fortune [<fortunes-file>] [options]"
    echo ""
    echo "  Prints a random fortune"
    echo ""
    echo "Options:"
    echo "  -h, --help         Show this message and exit"
    echo "  --login-message    Changes the user login message to the random fortune"
    exit 0;
fi

file=${1:-$HOME/.fortunes}

if [[ ! -f $file ]]; then
	file="/Library/Fortunes/fortunes.txt"
	if [[ ! -f $file ]]; then
	    echo "No file passed in, and no .fortunes file in your home directory."
	    exit 1;
    fi
fi

data=`cat $file | grep -v '^#.*\$'`

# Find out what our line range is
# erroring out if there is no quote to show
lines=`echo "$data" | wc -l`
if [[ $lines == 0 ]]; then
    echo "The fortune file has no quotes in it";
    exit 1;
fi

# Choose a random line to show
line=`expr $(($RANDOM % $lines)) + 1`

# Get the Nth line in the file
out=`echo "$data" | sed -n "${line}p"`

has_author=`echo $out | grep "\-\-" | wc -l`

# Strip any whitespace, and see if there was an author
# which would imply a differing output model
msg=""
author=""
if [[ `echo $has_author` == "0" ]]; then
    msg=`echo $out | sed 's/.*/"&"/'` | sed 's/\"/\\"/';
else
    msg=`echo $out | sed 's/ *--.*$//' | sed 's/.*/"&"/' | sed 's/\"/\\"/'`
    author=`echo $out | sed 's/.*--/--/'`;
fi

# Show the output
# this toggles what it does with the output
if [[ "$0 $@" == *" --login-msg"* ]]; then
    sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "$msg"
else
    echo $msg
    if [[ $author != '' ]]; then
        echo $author
    fi
    echo ''
fi
