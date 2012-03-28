@echo off

rem THIS IS KOSTYL
if exist "C:\Program Files\Git\bin\sh.exe" (
	cmd /c C:\Program Files\Git\bin\sh.exe --login -i
) else (
	rem For KIRUSHA's computer
	cmd.exe /c "d:\Program Files (x86)\Git\bin\sh.exe" --login -i
)