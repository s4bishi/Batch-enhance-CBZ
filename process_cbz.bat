@echo off
setlocal enabledelayedexpansion

rem Define directories
set "cbz_folder=C:\Users\guilh\OneDrive\Desktop\ESRGAN_April_2022\Blue Box (Digital) (1r0n)"  rem Folder containing CBZ files
set "input_folder=C:\Users\guilh\OneDrive\Desktop\ESRGAN_April_2022\input"        rem Use existing input folder
set "output_folder=C:\Users\guilh\OneDrive\Desktop\ESRGAN_April_2022\output"      rem Use existing output folder
set "result_folder=C:\Users\guilh\OneDrive\Desktop\ESRGAN_April_2022\RESULTS"      rem Folder to store resulting CBZ files

rem Change to the directory where the script is located
cd /d "%~dp0"

rem Create the necessary result folder if it does not exist
if not exist "%result_folder%" mkdir "%result_folder%"

rem Loop through each CBZ file in the current directory
for %%f in ("%cbz_folder%\*.cbz") do (
    rem Clear the INPUT folder
    echo Clearing the INPUT folder...
    for /d %%x in ("%input_folder%\*") do rmdir /s /q "%%~x"
    for %%x in ("%input_folder%\*") do del /q "%%~x"

    rem Extract the CBZ file to the INPUT folder using 7-Zip
    echo Extracting "%%f" to "%input_folder%"
    "C:\Program Files\7-Zip\7z.exe" x "%%f" -o"%input_folder%" -y

    rem Process images in the INPUT folder
    call UPSCALE_animevideov3_x2.bat

    rem Create a new CBZ file from processed images in the OUTPUT folder using 7-Zip
    echo Creating new CBZ file from processed images...
   "C:\Program Files\7-Zip\7z.exe" a -tzip "%result_folder%\processed_%%~nf.cbz" "%output_folder%\*"

    rem Clear the OUTPUT folder
    echo Clearing the OUTPUT folder...
    for /d %%x in ("%output_folder%\*") do rmdir /s /q "%%~x"
    for %%x in ("%output_folder%\*") do del /q "%%~x"

    rem Clear the INPUT folder again to avoid leftovers
    echo Clearing the INPUT folder...
    for /d %%x in ("%input_folder%\*") do rmdir /s /q "%%~x"
    for %%x in ("%input_folder%\*") do del /q "%%~x"
)

rem echo All CBZ files have been processed. Results are in "%result_folder%".
pause


