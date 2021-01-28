
@echo off

xcopy /YEIHR %~dp0 C:\Windows\System32

sqlplus sys as sysdba/
