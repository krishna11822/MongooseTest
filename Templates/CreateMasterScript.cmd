@echo off
echo CreateMasterScript.cmd
echo This cmd file will concatenate all the sql scripts
echo from the "Views", "Functions" and "Stored Procedures" 
echo folders into a single script.  You may need to edit the
echo script to replace the database names.
echo.
echo working...

IF EXIST MasterCreateApp.sql del MasterCreateApp.sql

echo -- MasterCreateApp.sql > MasterCreateApp.sql.txt
echo. > MasterCreateApp.sql.txt

for %%f in (ApplicationDB\*.udf) do (
  for /F "usebackq delims=" %%t in ("%%f") do echo %%t >> MasterCreateApp.sql.txt
  echo. >> MasterCreateApp.sql.txt
)

for %%f in (ApplicationDB\*.sql) do (
  for /F "usebackq delims=" %%t in ("%%f") do echo %%t >> MasterCreateApp.sql.txt
  echo. >> MasterCreateApp.sql.txt
)

for %%f in (ApplicationDB\*.prc) do (
  for /F "usebackq delims=" %%t in ("%%f") do echo %%t >> MasterCreateApp.sql.txt
  echo. >> MasterCreateApp.sql.txt
)

rename MasterCreateApp.sql.txt MasterCreateApp.sql

echo Done.
pause