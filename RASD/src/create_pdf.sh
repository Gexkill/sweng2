#!/bin/sh
sed -E 's,^\s*\[//\]: # \(([^)]+)\).*$,\\\1,;s/\?raw=true//g' < index.md | pandoc --template=mytemplate.latex -f markdown -o ../RASD.pdf
