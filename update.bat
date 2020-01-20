D:
cd %~dp0

md docs
python gen-md.py
copy README.md index.md .\docs\
mkdocs gh-deploy
rmdir /s /q site docs

git add .
git commit -m "Add files via upload"
git push -f origin master

pause