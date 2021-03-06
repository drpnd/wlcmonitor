#!/bin/sh

# Copyright (c) 2015,2017 Hirochika Asai <asai@jar.jp>
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

cnt=0

IFS="
"

for line in `snmpwalk -On -v2c -c "$community" "$host" .1.3.6.1.4.1.9.9.513.1.1.1.1.5 | sed -e 's/\.1\.3\.6\.1\.4\.1\.9\.9\.513\.1\.1\.1\.1\.5\.\([0-9\.]*\).*STRING: \"\(.*\)\"/\1 \2/'`;
do
        IFS=" "
        set $line
	apname=$2
        suffix=$1
        oid=".1.3.6.1.4.1.9.9.513.1.1.1.1.49.$suffix"
        loc=`snmpwalk -On -v2c -c "$community" "$host" $oid | sed -e 's/.*STRING: \"\(.*\)\"/\1/'`
        echo $apname $loc
done
