#!/bin/sh
./create_pdf.sh
cd alloy
./merge.sh >../../../Deliveries/all.als
cd ..
cp ../RASD.pdf ../../Deliveries
