oh-my-posh init pwsh --config "C:\Users\Uqai\AppData\Local\Programs\oh-my-posh\themes\BlackHack-Theme.omp.json" | Invoke-Expression
Import-Module -Name Terminal-Icons
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# This key handler shows the entire or filtered history using Out-GridView. The
# typed text is used as the substring pattern for filtering. A selected command
# is inserted to the command line without invoking. Multiple command selection
# is supported, e.g. selected by Ctrl + Click.
Set-PSReadLineKeyHandler -Key F7 `
                         -BriefDescription History `
                         -LongDescription 'Show command history' `
                         -ScriptBlock {
    $pattern = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$pattern, [ref]$null)
    if ($pattern)
    {
        $pattern = [regex]::Escape($pattern)
    }

    $history = [System.Collections.ArrayList]@(
        $last = ''
        $lines = ''
        foreach ($line in [System.IO.File]::ReadLines((Get-PSReadLineOption).HistorySavePath))
        {
            if ($line.EndsWith('`'))
            {
                $line = $line.Substring(0, $line.Length - 1)
                $lines = if ($lines)
                {
                    "$lines`n$line"
                }
                else
                {
                    $line
                }
                continue
            }

            if ($lines)
            {
                $line = "$lines`n$line"
                $lines = ''
            }

            if (($line -cne $last) -and (!$pattern -or ($line -match $pattern)))
            {
                $last = $line
                $line
            }
        }
    )
    $history.Reverse()

    $command = $history | Out-GridView -Title History -PassThru
    if ($command)
    {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert(($command -join "`n"))
    }
}

Set-PSReadLineKeyHandler -Key Ctrl+Shift+s `
                         -BriefDescription BuildCurrentDirectory `
                         -LongDescription "Inicia Start en directorio NPM" `
                         -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("npm start")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

Set-PSReadLineKeyHandler -Key Ctrl+Shift+g `
                         -BriefDescription BuildCurrentDirectory `
                         -LongDescription "Git Commit" `
                         -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('git commit -m ": (#)"')
}
