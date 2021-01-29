# IcedShark

PLEASE USE AT OWN RISK. I AM NOT RESPONSIBLE FOR ANY DAMAGE THEESE PROGRAMS MAY CAUSE!!!!!

IcedShark is a project to learn offensive securtity tactics during my spare time. The project will include both red team and blue team tools in the future along with updates and scripts to easily make changes to key variables within the programs. Please excuse any mistakes as i am just a student.

# Windows Credential Manager Password Stealer:
  - Windows credential manager stores passwords that can be accessed and dumped even as a non privileged user and therefore makes a very easy attack vector.
  - The program encodes the powershell payload into a certificate with certutil -encode <powershellFile.ps1> and is stored on a public server to be downloaded by a remote machine. 
  - A windows macro is used to download the certificate and decode it with the same certutil command line utility preinstalled on windows. The script is then run and the resulting
  file is encoded into a certificate again and it is sent to the same remote server where the payload was downloaded from. 
  - The tool can be used to test social engineering tactics along with privilege escalation as it may present passwords that are within the realm of a pentest. 
  - i plan on creating a script to prevent this attack that will be uploaded in the future.
  - the server ip will need to be changed within the script if you want to run it
  - the listening time on the python server socket is set to only 5 seconds because this program is undergoing final testing and is therefore not quite finished yet. 
  
  # IcedShark.ps1
 - the main program within ths project. it carries out a series of commands to enumerate the local system, check for local privilege escalation, extract SYSTEM and SAM files if
 the current running user has local administrator permissions and checks for passwords within the registry. THIS PROGRAM IS VERY BUGGY AND IS STILL BEING TROUBLESHOOTED so 
 please excuse the errors. It also only uses ftp to a kali machine in order to place the contents of the command output. the program will store all files it creates on the root of the C drive so it requires local admin to run. This program will be updated as soon as possible and be broken down into smaller scripts to perform more specific tasks in the future.
 
 # privEsc.bat
 - privilege escalation batch script that checks for unquoted service paths that can lead to a binary being placed in the corresponding directory allowing for a privileged user 
 to be added giving the security professional access to a higher privilege level. This is a very short program that i am working on adding to IcedShark.ps1 but i am having issues with searching for the unqoted paths due to the powershell integrated scripting environment. Any help would be appreciated.
 
 
