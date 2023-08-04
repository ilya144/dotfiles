WHITE='\033[0;37m'
BLUE='\033[0;34m'

for D in *; do
    if [ -d "${D}" ]; then
        echo "==> searching in ${BLUE}${D}${WHITE}"
        cd "${D}" 
        ls | grep node_modules && rm -rf ./node_modules
        cd ..
    fi
done
