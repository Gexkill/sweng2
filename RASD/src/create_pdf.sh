#!/bin/sh
sed -E 's,^\s*\[//\]: # \(pagebreak\).*$,\\pagebreak,' < index.md | pandoc -f markdown -o ../RASD.pdf
