@echo off
title GITBACKUP:[INFO]GIT backup for server by sunnychon
cd data
title installing git lfs...
git lfs install
title installing git lfs...ok
for /f %%i in (cloneandpush.txt)  do (
set githublink=%%i)
for /f %%i in (name.txt)  do (
set clonedresp=%%i)
title GITBACKUP:[LOG]clone from github...
git clone %githublink%
cd "%clonedresp%"
git add .
title GITBACKUP:[LOG]clone from github...ok
:b
set githubpushtime=%time%
title GITBACKUP:[LOG]updtae! %githubpushtime%
title copying...
start ..\copy.bat 1
echo updating at time:%githubpushtime%
title GITBACKUP:[LOG]adding commit...
git commit -m pushat%githubpushtime%
title GITBACKUP:[LOG]adding commit...ok
title GITBACKUP:[LOG]pushing...
git push
title GITBACKUP:[LOG]pushing...ok
title GITBACKUP:[LOG]waiting for next backup time...
timeout /t 60 /nobreak
goto b


