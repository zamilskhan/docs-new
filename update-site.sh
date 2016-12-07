#! /bin/bash
rm -rf docs/
mkdocs build
mv site/ docs/
git add -A
git commit -m "updated site"
git push origin master
