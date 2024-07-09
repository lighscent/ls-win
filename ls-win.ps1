# LS-WIN by @light2k4
function ls {
    param(
        [string]$path = ".",
        [switch]$l
    )
    
    $items = Get-ChildItem -Path $path

    if ($l) {
        $items | ForEach-Object {
            $type = if ($_.PSIsContainer) { "dir " } else { "file" }
            $size = if ($_.PSIsContainer) { "-" } else { $_.Length }
            $lastWriteTime = $_.LastWriteTime
            $name = $_.Name
            "{0,-5} {1,10} {2,-20} {3}" -f $type, $size, $lastWriteTime, $name
        }
    } else {
        $items | ForEach-Object {
            Write-Output $_.Name
        }
    }
}
