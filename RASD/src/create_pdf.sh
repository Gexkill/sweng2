#!/bin/sh
sed -E 's,^\s*\[//\]: # \(pagebreak\).*$,\\pagebreak,;s/\?raw=true//g' < index.md | pandoc -f markdown -o ../RASD.pdf
