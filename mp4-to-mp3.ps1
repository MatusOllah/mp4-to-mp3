if (-not (Test-Path ".\out" -PathType Container)) {
    mkdir -Path ".\out"
}

$files = Get-ChildItem -Filter *.mp4 -Path "."

for ($i = 0; $i -le $files.Length; $i++) {
    $p = ($i/$files.Length)*100
    Write-Progress -Activity "Converting" -Status "$p% Complete:" -PercentComplete $p -CurrentOperation "Processing $($files[$i].Name)"
    Write-Host "Processing $($files[$i].Name)"
    Write-Host "$p% Complete"

    ffmpeg -i $files[$i].FullName ".\out\$($files[$i].Name.Replace("mp4", "mp3"))"
}