@echo off
:LOOPSTART
echo %time% >> pinglog.txt
echo 'Reaching Router' >> pinglog_gg.txt
%SystemRoot%\System32\ping.exe 192.168.1.1 -n 500 | %SystemRoot%\System32\findstr.exe /C:Packets /C:Minimum >>pinglog_web.txt
echo 'Reaching vpn' >> pinglog.txt
%SystemRoot%\System32\ping.exe 10.0.14.48 -n 500 | %SystemRoot%\System32\findstr.exe /C:Packets /C:Minimum >>pinglog_eud.txt
echo 'Reaching Google' >> pinglog.txt
%SystemRoot%\System32\ping.exe 8.8.8.8 -n 500 | %SystemRoot%\System32\findstr.exe /C:Packets /C:Minimum >>pinglog_gg.txt
GOTO LOOPSTART


