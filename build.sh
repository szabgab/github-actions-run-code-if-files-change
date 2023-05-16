if test ! -e was-build.txt;
then
    echo "start building"
    # ... building
    touch was-build.txt
fi

