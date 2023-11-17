# from https://gist.github.com/azizur/ffe8ee6a0a2bb418e5cc8ff101fad91a

cd web-static
wget -k -r -l 5 -p -E --restrict-file-names=windows -nH http://www.hotfeet.ch

echo "Remaining task: copy ~/ref_imgs (and files) manually."
