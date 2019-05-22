. ($PSScriptRoot + '.\constants.ps1')

if (Test-Path -Path ($path + "\" + $filename) -IsValid) {
    Write-Host "UPDATING $path\$filename" -ForegroundColor Green     
} else {
    New-Item -Type File -Name $filename -Path $path
    Write-Host "CREATING $path\$filename" -ForegroundColor Green
}

function jrnl {

    param(
        [string]$text
    )

    (Get-Date).ToString() + " | $text" | Out-File -FilePath ($path + "\" + $filename) -Append

}

# TODO: Turn this into a psm1 file and auto load this module when my profile loads

function jrno {
    code ($path + "\" + $filename)
}