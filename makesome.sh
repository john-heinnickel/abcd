#!/bin/sh

count="${1}"
size="${2}"

echo "${count}"
echo "${size}"
echo "==="

if [ "z${size}" = "z" ]
then
	echo "z${size}"
	size=1
fi
if [ "${size}" -lt 0 ]
then
	echo "lt0"
	size=1
fi

while [ "${count}" -gt 0 ]
do
	filenum="${size}"
	while [ "${filenum}" -gt 0 ]
	do
        	dir="$(openssl rand --hex 1)"
		file="$(openssl rand --hex 3)"
		mkdir -p "${dir}"
		dd if=/dev/urandom of="${dir}/${file}" bs=1024 count=8
		git add "${dir}/${file}"  
		echo "${filenum}"
		filenum="$(( ${filenum} - 1))"
	done
	message="$(openssl rand --hex 16)"
	git commit -m "${message}"
	echo "${count}"
	count="$(( ${count} - 1))"
done

