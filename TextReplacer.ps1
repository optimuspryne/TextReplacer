function Replace-Text {

    $directory = Read-Host "Where are/is the file(s) located "
    $fileType = Read-Host "What is the file extension (i.e .txt, .m3u, etc...) "
    $patternToReplace = Read-Host "What is the text/pattern you would like replaced "
    $replacementPattern = Read-Host "What is the new text/pattern "

    [array]$userFiles = Get-ChildItem -File $directory -Filter "*$($fileType)"
    [array]$userFiles = [array]$userFiles | Sort-Object { [regex]::Replace($_.Name, '\d+', { $args[0].Value.PadLeft(20) }) }

    foreach ($file in $userFiles) {
        (Get-Content -Path "$($directory)\$($file)").Replace($patternToReplace, $replacementPattern) | Set-Content -Path "$($directory)\$($file)"
    }
}

Replace-Text
