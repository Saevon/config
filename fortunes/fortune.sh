help="false"
login_msg="false"
edit="false"
file=


# options may be followed by one colon to indicate they have a required argument
if ! options=$(getopt -o h,e: -l help,login-msg,edit: -- "$@")
then
    # something went wrong, getopt will put out an error message for us
    exit 1
fi

set -- $options

while [ $# -gt 0 ]
do
    case $1 in
    -h|--help) help="true" ;;
    -e|--edit) edit="true" ;;
    --login-msg) login_msg="true" ;;

    # for options with required arguments, an additional shift is required
    # -c|--clong) cargument="$2" ; shift;;
    # (--) shift; break;;
    # (-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
    # (*) break;;
    esac
    shift
done



# Usage
if [[ $help == "true" ]]; then
    echo "Usage: fortune [<fortunes-file>] [options]"
    echo ""
    echo "  Prints a random fortune"
    echo "  if it doesn't find the given file, it uses the defaults:"
    echo "    '$HOME/.fortunes' or '/Library/Fortunes/fortunes.txt'"
    echo ""
    echo "Options:"
    echo "  -h, --help     Show this message and exit"
    echo "  -e, --edit     Edits the fortunes file (used to edit the default file)"
    echo "  --login-msg    Changes the user login message to the random fortune"
    exit 0;
fi


# Find out which fortunes file to use
file=${1:-$HOME/.fortunes}
if [[ ! -f $file ]]; then
    file="/Library/Fortunes/fortunes.txt"
    if [[ ! -f $file ]]; then
        echo "No file passed in, and no .fortunes file in your home directory."
        exit 1;
    fi
fi

# Allow file editing
if [[ $edit == "true" ]]; then
    ${EDITORA:-vim} $file

    exit 0;
fi





# Read the file, ignoring comments
data=`cat $file | grep -v '^#.*\$' | sed 's/#.*//' `

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
    msg=`echo $out | sed 's/.*/"&"/' | sed 's/\"/\\"/'`;
else
    msg=`echo $out | sed 's/ *--.*$//' | sed 's/.*/"&"/' | sed 's/\"/\\"/'`;
    author=`echo $out | sed 's/.*--//'`;
fi

# Debug messages on error
if [[ $msg == '' ]]; then
    echo 'ERROR: debug info being dumped'
    echo $has_author
    echo $out
    echo $line
    echo $help, $edit, $login_msg
fi

# Show the output
# this toggles what it does with the output
if [[ $login_msg == "true" ]]; then
    sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "$msg"
else
    echo $msg
    if [[ $author != '' ]]; then
        echo "--$author"
    fi
    echo ''
fi
