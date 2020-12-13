D:
cd %~dp0

md docs
python gen-md.py
copy README.md .\docs\index.md
mkdocs gh-deploy
rmdir /s /q site docs

git add *
git commit -m "Add files via upload"
git push -f origin master

pause