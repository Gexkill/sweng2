#!/bin/sh
sed -E 's,\s*\[//\]: # \((backslash|([^)]*))\),\\\2,g;s/\?raw=true//g' < index.md | pandoc --template=mytemplate.latex -f markdown -o ../RASD.pdf
