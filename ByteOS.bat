@echo off
:: ByteOS - A Simple Batch-Based "Operating System"
title ByteOS - Command Line Interface
color 0A

:: Ask for Username
cls
echo ============================================
echo         Welcome to ByteOS!
echo ============================================
set /p username="Enter your username: "
echo Welcome, %username%! Press any key to continue...
pause > nul

:menu
cls
echo ============================================
echo                 ByteOS
echo ============================================
echo 1. File Explorer
echo 2. Notepad
echo 3. Calculator
echo 4. Shutdown
echo 5. Task Manager
echo 6. Mini Games
echo 7. Open Google
echo 8. Exit
echo.
set /p choice="Enter a command (or type Rick/Creator): "

if "%choice%"=="1" call :fileExplorer
if "%choice%"=="2" call :openNotepad
if "%choice%"=="3" call :calculator
if "%choice%"=="4" call :shutdownOptions
if "%choice%"=="5" call :taskManager
if "%choice%"=="6" call :miniGames
if "%choice%"=="7" start https://www.google.com
if "%choice%"=="8" exit
if "%choice%"=="Rick" start https://www.youtube.com/watch?v=dQw4w9WgXcQ
if "%choice%"=="Creator" start https://github.com/AverageUser1231

goto menu

:: File Explorer
:fileExplorer
cls
echo File Explorer:
echo 1. List files
echo 2. Create a file
echo 3. Delete a file
echo 4. Open a file
echo 5. Back to menu
set /p fechoice="Select an option: "
if "%fechoice%"=="1" dir & pause
if "%fechoice%"=="2" set /p filename="Enter file name: " & echo. > %filename%
if "%fechoice%"=="3" set /p delfile="Enter file name to delete: " & del %delfile%
if "%fechoice%"=="4" set /p openfile="Enter file name to open: " & start %openfile%
goto menu

:: Open Notepad
:openNotepad
notepad.exe
goto menu

:: Calculator
:calculator
set /p calc="Enter equation (e.g. 5+5): "
set /a result=%calc%
echo Result: %result%
pause
goto menu

:: Shutdown Options
:shutdownOptions
cls
echo Shutdown Options:
echo 1. Shutdown PC
echo 2. Cancel Shutdown
echo 3. Back to menu
set /p shutchoice="Select an option: "
if "%shutchoice%"=="1" shutdown.exe -s -t 10
if "%shutchoice%"=="2" shutdown.exe -a
goto menu

:: Task Manager
:taskManager
tasklist
pause
goto menu

:: Mini Games
:miniGames
cls
echo Mini Games:
echo 1. Number Guessing Game
echo 2. Back to menu
set /p gamechoice="Choose a game: "
if "%gamechoice%"=="1" call :guessGame
goto menu

:: Number Guessing Game
:guessGame
set /a target=%random% %% 10 + 1
set /p guess="Guess a number between 1 and 10: "
if "%guess%"=="%target%" (echo Correct! You win! & pause) else (echo Wrong! The number was %target% & pause)
goto menu
