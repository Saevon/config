#!/bin/bash
FULLPATH=$1
FILE=`/usr/bin/basename "$FULLPATH"`
PATH=`/usr/bin/dirname "$FULLPATH"`
EXT=${FILE##*.}
FILENAME=${FILE%.*}

OUT="$TMPDIR/login-back.png"

if [ "$EXT" != "png" ]; then
    /usr/bin/sips -s format png "$FULLPATH" --out $OUT
else
    /bin/cp "$FULLPATH" $OUT
fi

RES=/System/Library/PrivateFrameworks/LoginUIKit.framework/Versions/A/Frameworks/LoginUICore.framework/Versions/A/Resources/

/bin/cp $OUT $RES/apple.png
/bin/cp $OUT $RES/apple@2x.png
/bin/cp $OUT $RES/apple_s1.png
/bin/cp $OUT $RES/apple_s1@2x.png

# Cover the Newer macs
/usr/local/bin/convert $OUT /Library/Caches/com.apple.desktop.admin.png

/bin/rm $OUT
