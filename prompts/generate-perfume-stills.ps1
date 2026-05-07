# Batch-generate unified perfume bottle stills via Higgsfield Nano Banana 2 image-to-image.
#
# Reads `data/perfumes.json`, finds matching ref in `parfumes_images/refs/<id>.{png|jpg|jpeg|webp}`,
# generates a final at `parfumes_images/<id>.png` using the unified editorial style
# from `prompts/product-still.txt` (extended for image-to-image: preserve bottle,
# replace background, normalize lighting).
#
# Skips entries whose final already exists. ASCII-safe to avoid PowerShell tokenization.
# Re-runnable: only missing finals are re-generated.

$ErrorActionPreference = 'Continue'
$root  = Split-Path -Parent $PSScriptRoot
$catalog = Join-Path $root 'data\perfumes.json'
$refsDir = Join-Path $root 'parfumes_images\refs'
$outDir  = Join-Path $root 'parfumes_images'

if (-not (Test-Path $catalog)) { Write-Host "missing $catalog"; exit 1 }
$data = Get-Content $catalog -Raw | ConvertFrom-Json
$entries = $data.perfumes

# Unified style prompt for image-to-image. Tells Nano Banana to keep bottle/cap/label
# verbatim from the input image and only replace the backdrop + lighting.
$style = @"
Editorial luxury perfumery still life. Use the bottle from the input image exactly as-is: keep its shape, cap, label, color, liquid level, and brand mark fully intact and clearly readable. Do not redesign the bottle. Do not add or remove elements on the bottle.

Replace only the background and lighting. Smooth ivory backdrop, color hex EFE9E0, with a subtle warm beige to champagne gradient. Soft directional window light from upper left, gentle long shadow falling lower right. Matte cream surface under the bottle. Ultra realistic, 35mm film grain, shallow depth of field, focus on the bottle.

Three-quarter front angle, bottle centered, generous negative space top and bottom. No text overlays, no watermark, no people, no hands, no extra props, no flowers, no fabric, no neon. Quiet, sophisticated, Aesop / Margiela editorial aesthetic.
"@

$jobs = @()
foreach ($p in $entries) {
    $id = $p.id
    $finalPath = Join-Path $outDir "$id.png"

    # Find a ref by id with any common extension
    $ref = $null
    foreach ($ext in 'png','jpg','jpeg','webp') {
        $candidate = Join-Path $refsDir "$id.$ext"
        if (Test-Path $candidate) { $ref = $candidate; break }
    }
    if (-not $ref) {
        Write-Host "[SKIP no ref] $id"
        continue
    }
    if (Test-Path $finalPath) {
        Write-Host "[SKIP exists] $id"
        continue
    }
    $jobs += [pscustomobject]@{ id = $id; ref = $ref; out = $finalPath; brand = $p.brand; name = $p.name }
}

$total = $jobs.Count
if ($total -eq 0) { Write-Host "Nothing to do."; exit 0 }
Write-Host "Generating $total perfume still(s)..."

$i = 0
foreach ($j in $jobs) {
    $i++
    Write-Host ("[{0}/{1}] {2} - {3} {4}" -f $i, $total, $j.id, $j.brand, $j.name)
    Write-Host ("  ref: {0}" -f $j.ref)

    $resp = higgsfield generate create nano_banana_flash `
        --prompt $style `
        --image $j.ref `
        --aspect_ratio 4:5 `
        --wait `
        --wait-timeout 4m 2>&1

    $url = ($resp | Where-Object { $_ -match '^https?://.+\.(png|jpg|jpeg|webp)(\?.*)?$' } | Select-Object -Last 1)
    if (-not $url) {
        Write-Host "  FAILED - no URL in response"
        $resp | Select-Object -Last 6 | Write-Host
        continue
    }
    try {
        Invoke-WebRequest $url -OutFile $j.out -UseBasicParsing -ErrorAction Stop
        $size = [math]::Round((Get-Item $j.out).Length / 1024)
        Write-Host ("  OK  {0} KB -> parfumes_images/{1}.png" -f $size, $j.id)
    } catch {
        Write-Host ("  download failed: {0}" -f $_)
    }
}

Write-Host "DONE."
