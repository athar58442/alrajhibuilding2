$dom = [System.IO.File]::ReadAllText("C:\Users\alira\.gemini\antigravity\scratch\alrajhi-luxury-3d\dom.txt")
if ($dom -match '<p id="done">\d+x\d+:::data:image/png;base64,([^<]+)</p>') {
    $base64 = $matches[1]
    $bytes = [System.Convert]::FromBase64String($base64)
    [System.IO.File]::WriteAllBytes("C:\Users\alira\.gemini\antigravity\scratch\alrajhi-luxury-3d\logo.png", $bytes)
    Write-Host "logo.png saved successfully! Size: $($bytes.Length) bytes"
} else {
    Write-Host "Could not match base64"
}
