' -------------------------------------------------------------------------------------- '
'   (C) Marcio Andrey Oliveira <plicatibu@plicatibu.com>                                 '
'   Simple build file for Haxe-Phaser sample code.                                       '
'                                                                                        '
'   license MIT License (https://github.com/photonstorm/phaser/blob/master/license.txt)  '
' -------------------------------------------------------------------------------------- '

option explicit

Dim scriptToRun
Dim objShell
Dim currentDirectory
Dim projectName
Dim arrNames

currentDirectory = left(WScript.ScriptFullName,(Len(WScript.ScriptFullName))-(len(WScript.ScriptName)))
''WScript.Echo "currentDirectory from caller ["& currentDirectory & "]" 

arrNames = Split(currentDirectory, "\")
projectName = arrNames(Ubound(arrNames) - 1)


Set objShell = Wscript.CreateObject("WScript.Shell")
scriptToRun = "..\..\build.vbs"
objShell.Run scriptToRun & " " & projectName & " " & currentDirectory

Set objShell = Nothing