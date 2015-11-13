#!/bin/sh
sed -E 's,\s*\[//\]: # \(([^)]*)\),\\\1,g;s/\?raw=true//g;s/^!\[([^]]+)\s+backslash\](.*)$/![\1]\2\\/g' < index.md | pandoc -f markdown -o ../DD.pdf
