net start > services.txt
net stop "Server"
timeout /t 1
net start > services2.txt
fc C:\Lab6\3\services.txt C:\Lab6\3\services2.txt > difference.txt
net start "Server"