echo [+]Beginning Privilege Escalation Script...
echo [+]Enumerating Local System Patches...
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" >> privesc.txt


echo [+]Checking For Unquoted Service Paths...
wmic service get name,pathname,displayname,startmode | findstr /i auto | findstr /i /v "C:\Windows\\" | findstr /i /v """ >> privesc.txt 

echo [+]Querying registry for possible local privilege escalation 
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" >> privesc.txt
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" >> privesc.txt
reg query "HKLM\SYSTEM\Current\ControlSet\Services\SNMP" >> privesc.txt
reg query "HKCU\Software\SimonTatham\PuTTY\Sessions" >> privesc.txt
reg query "HKLM\Software\Microsoft\FTH" /V RuleList >> privesc.txt

echo [+]Querying startup tasks
wmic startup get caption,command >> privesc.txt
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run >> privesc.txt
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce >> privesc.txt

echo [+]Checking if install elevated is enabled
reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated >> privesc.txt
reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated >> privesc.txt

echo [+]Checking if user can extract local system password hashes
echo [+]Attempting to create shadow copy of local C:\ drive
vssadmin create shadow /for=C: >> privesc.txt

echo INFO: Unquoted service paths can cause a local user to inject a malicious binary into that process that is running at a higher privilege level
echo INFO: AlwaysInstallElevated allows a local system user to install .msi files as local administrator allowing for local privilege escalation
echo INFO: unpatched local systems can have privilege escalation bugs and therefore should be patched to the most recent version
echo INFO: Results exported into pricesc.txt in the same directory where this program was executed from
pause