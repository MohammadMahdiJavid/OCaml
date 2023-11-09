@echo off

REM pull the latest changes
git pull

REM Add all changed files
git add -A

REM Set the commit message format
set "commit_message=Auto-commit on %DATE% %TIME%"

git commit -m "%commit_message%"

REM Push the changes
git push

