#!/bin/bash

# 1. Enter the marketing folder / Մտնել թղթապանակ
cd /data/marketing

# 2. Create folders / Ստեղծել թղթապանակները
mkdir -p Printable Vector Image Docs

# 3. Move files by type / Տեղափոխել ֆայլերը ըստ տեսակի
echo "Sorting files..."

mv *.pdf Printable/
mv *.svg *.ai *.cdr Vector/
mv *.jpg *.gif *.heic Image/
mv *.doc *.docx *.odt Docs/

echo "Verch!"
