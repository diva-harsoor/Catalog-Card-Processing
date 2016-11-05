# This is the path to the peabody_files directory
ROOT=C:/peabody_files

# Path to the ghostscript executable
GS="C:/Program Files/gs/gs9.20/bin/gswin64c.exe"


# Remove space from Accession Files directory name
mv "$ROOT/Accession Files" $ROOT/Accession_Files

# Iterate through the Acc. No. directories and remove spaces from there names
for f in $ROOT/Accession_Files/*
do
    NEWFNAME=`echo $f | sed "s/\s/_/g"`
    echo "Renaming $f to $NEWFNAME"
    mv "$f" $NEWFNAME
done

# Iterate through the Acc. No. directories and convert all pdfs to tifs
for f in $ROOT/*
do
    for f2 in $f/*.pdf
    do
        echo "Converting $f2"
        
        # Create the tif
        # This command was obtained from http://wiki.ephesoft.com/ghostscript-pdf-to-tiff-conversion
        $GS -dNOPAUSE -r300 -sDEVICE=tiffscaled24 -sCompression=lzw -dBATCH -sOutputFile=$f2.tif $f2
    done
    # Delete the original pdfs
    rm $f/*.pdf -f
done
