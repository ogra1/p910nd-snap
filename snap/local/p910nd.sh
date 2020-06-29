#! /bin/sh

set -x

DEVICE=""
ADDR=""
BIDI=""

if [ -n "$(snapctl get device)" ]; then
	DEVICE="-f $(snapctl get device)"
fi

if [ -n "$(snapctl get bindaddr)" ]; then
	ADDR="-i $(snapctl get bindaddr)"
fi

if [ -n "$(snapctl get bidirectional)" ]; then
	BIDI="-b"
fi

exec p910nd -d $DEVICE $ADDR $BIDI 2>&1
