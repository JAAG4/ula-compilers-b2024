echo "TESTING"
echo "==> $1"
echo "=> Scanner"
./../build/_scanner "$1"
echo "=> Validator"
./../build/validator "$1"
echo "- - - - - - - -"
echo " "