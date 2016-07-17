remove_icon(){
    droplet=$1
    rm -rf $droplet'/Icon\r' > /dev/null
}

replace_icon(){
    droplet=$1
    icon=$2
    if [[ $icon =~ ^https?:// ]]; then
        curl -sLo /tmp/icon $icon
        icon=/tmp/icon
    fi

    remove_icon $droplet

    DeRez -only icns $icon > /tmp/icns.rsrc
    Rez -append /tmp/icns.rsrc -o $droplet$'/Icon\r'
    SetFile -a C $droplet
    SetFile -a V $droplet$'/Icon\r'
}


