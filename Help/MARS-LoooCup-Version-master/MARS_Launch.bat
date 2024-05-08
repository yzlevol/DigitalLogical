if "%1"=="hide" goto CmdBegin
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)&&exit
:CmdBegin
@echo off  
java -jar MARS_Looo_signal_final_V1.0.jar
exit  
