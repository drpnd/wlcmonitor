#!/bin/sh

# Copyright (c) 2015 Hirochika Asai <asai@jar.jp>
# All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

if [ -z "$1" -o -z "$2" ];
then
	echo "Usage: $0 host community" >& 2
	exit -1
fi;

host=$1
community=$2

echo "#a b g n(2.4g) n(5g) ac" >&2

snmpwalk -On -v2c -c "$community" "$host" .1.3.6.1.4.1.9.9.599.1.3.1.1.6 \
	| sed -e 's/.*INTEGER: \([0-9]*\)/\1/' | sort -n | uniq -c \
	| awk '{data[$2]=$1}END{printf "%d %d %d %d %d %d\n", data[1], data[2], data[3], data[6], data[7], data[10]}'

