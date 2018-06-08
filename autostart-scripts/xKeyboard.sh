#!/bin/sh

xkbcomp $(dirname $0)/../custom-layout.xkb $DISPLAY
