source ./lib/math_functions
. ./lib/util_functions

usage_text=" ganze Zahl"
if ! [ $# -eq 1 ]; then
    err_usage
    exit 1
fi

if is_int $1; then
    echo "Ganze Zahl"
else
    echo "Keine Ganze Zahl"
fi
