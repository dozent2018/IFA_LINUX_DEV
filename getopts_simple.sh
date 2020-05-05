while getopts abC: option 2>/dev/null; do
    case $option in
        a) echo "Option -a erkannt" ;;
        b) echo "Option -b erkannt" ;;
        C) echo "Option -C mit $OPTARG erkannt" ;;
        ?) echo "$option : Unbekannte Option"
           break ;;
    esac
done
