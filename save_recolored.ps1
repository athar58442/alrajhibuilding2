$txt = [System.IO.File]::ReadAllText("C:\Users\alira\.gemini\antigravity\scratch\alrajhi-luxury-3d\recolor_out.txt")
if ($txt -match '<p id="result">data:image/png;base64,([^:]+):::data:image/png;base64,([^<]+)</p>') {
    $goldBase64 = $matches[1]
    $whiteBase64 = $matches[2]

    $goldBytes = [System.Convert]::FromBase64String($goldBase64)
    [System.IO.File]::WriteAllBytes("C:\Users\alira\.gemini\antigravity\scratch\alrajhi-luxury-3d\logo_gold.png", $goldBytes)
    Write-Host "logo_gold.png saved! Size: $($goldBytes.Length) bytes"

    $whiteBytes = [System.Convert]::FromBase64String($whiteBase64)
    [System.IO.File]::WriteAllBytes("C:\Users\alira\.gemini\antigravity\scratch\alrajhi-luxury-3d\logo_white.png", $whiteBytes)
    Write-Host "logo_white.png saved! Size: $($whiteBytes.Length) bytes"

    # Also make logo_gold.png our primary logo.png so everything automatically gets the matching gold!
    [System.IO.File]::WriteAllBytes("C:\Users\alira\.gemini\antigravity\scratch\alrajhi-luxury-3d\logo.png", $goldBytes)
    [System.IO.File]::WriteAllBytes("C:\Users\alira\.gemini\antigravity\scratch\logo.png", $goldBytes)
    Write-Host "logo.png updated with pure transparent gold emblem!"
} else {
    Write-Host "Regex match failed"
}
