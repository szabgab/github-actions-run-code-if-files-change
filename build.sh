if test ! -e already-built.txt;
then
    echo "start building"
    # ... building
    touch already-built.txt
fi

