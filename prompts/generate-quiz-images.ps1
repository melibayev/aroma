# Batch-generate quiz imagery via Higgsfield Nano Banana 2.
# Style anchor: family_images/quiz/family-citrus.png (editorial moody still-life, painterly, soft window light, Aesop aesthetic).
# All prompts are ASCII-safe to avoid PowerShell tokenization issues.

$ErrorActionPreference = 'Continue'
$style = "Editorial moody still life. Painterly photographic mood. Soft natural window light from upper left, deep shadows with warm ivory highlights. Aesop and Margiela editorial aesthetic. Shallow depth of field, 4:5 portrait crop, ultra realistic, fine grain. No text, no logos, no captions, no bottles, no brand marks, no people faces."

$jobs = @(
    # --- gender (4) ---
    @{ f = "gender-men.png";       p = "$style A masculine abstract still life: a folded charcoal linen shirt with rolled cuff resting on dark oak, beside it a vintage leather watch strap, a single sprig of fresh rosemary, a few sage leaves, traces of cedar shavings. No face. Cool slate undertone fading to warm amber." }
    @{ f = "gender-women.png";     p = "$style A feminine abstract still life: a single white peony bloom resting on cream silk fabric, a strand of soft pearls, a delicate curl of ivory ribbon, a small glass of rose water. No face. Pale pink, ivory, soft champagne tones." }
    @{ f = "gender-unisex.png";    p = "$style A neutral abstract still life: a single smooth river stone resting on natural linen, two pale eucalyptus leaves, a small clear glass of water with soft refraction, a sprig of lavender. No face. Balanced soft cool and warm neutrals." }
    @{ f = "gender-any.png";       p = "$style A minimal monochrome abstract: a textured slab of warm beige plaster wall, side-lit, no objects placed on it, soft visible grain, painterly chiaroscuro, contemplative emptiness." }

    # --- season (5) ---
    @{ f = "season-spring.png";    p = "$style Spring still life: a fresh cherry blossom branch laid on cream linen, a single dewy white magnolia petal, soft morning light filtered through a sheer linen curtain. Pale pink, ivory, soft fresh green undertones." }
    @{ f = "season-summer.png";    p = "$style Summer still life: dappled golden sunlight across a sliced ripe fig and a halved peach with leaves attached, droplets of water on white linen tablecloth. Warm golden hour tones with deep contrasting shadows." }
    @{ f = "season-fall.png";      p = "$style Autumn still life: a single copper-red maple leaf, a dried oak twig, fragments of cinnamon bark, beads of amber tree resin, on dark walnut wood. Deep amber, rust, and burgundy palette." }
    @{ f = "season-winter.png";    p = "$style Winter still life: a sprig of juniper dusted with frost, a smooth grey river stone touched by delicate ice crystals, faint mist of breath drifting across cold dark linen. Slate blue, charcoal, and frost white tones." }
    @{ f = "season-any.png";       p = "$style A balanced cyclical still life: a small arrangement of dried lavender, a single weathered seashell, a fragment of aged oak, on ivory linen. Balanced cool and warm neutrals, timeless." }

    # --- mood (8) ---
    @{ f = "mood-day.png";         p = "$style Bright morning interior still life: a folded white cotton sheet with sun rays passing through a sheer curtain, a single white flower in a clear glass, a glass of water with light caustics. Luminous, airy, pale yellow and white." }
    @{ f = "mood-evening.png";     p = "$style Evening interior still life: dim warm lamp light glowing over dark velvet, a stemless glass of red wine, a single tall candle with a soft flame, a small brass detail. Deep amber, burgundy, and shadow." }
    @{ f = "mood-work.png";        p = "$style Quiet office still life: a crisp white shirt cuff resting on cream paper, a black fountain pen, a small white espresso cup with crema, soft daylight. Clean, quiet, mostly ivory and warm white." }
    @{ f = "mood-elegant.png";     p = "$style Intimate dinner still life: the edge of a candlelit table, a single calla lily, soft silk drape, gold flatware in soft focus, a glass of champagne. Romantic warm low light, deep amber tones." }
    @{ f = "mood-bold.png";        p = "$style Luxurious ceremonial still life: deep burgundy velvet drape, a polished obsidian sphere, a single dramatic black orchid, deep saturated jewel tones, dramatic side lighting." }
    @{ f = "mood-calm.png";        p = "$style Everyday calm still life: a folded linen kitchen towel, a single peach in soft daylight, a sprig of olive branch, a simple matte ceramic bowl. Gentle natural light, sense of ease." }
    @{ f = "mood-warm.png";        p = "$style Cozy hearth still life: a chunky wool blanket folded on dark wood, an open hardcover book, a small lit candle, fragments of dried orange peel and a cinnamon stick. Warm amber tones, low evening light." }
    @{ f = "mood-fresh.png";       p = "$style Crisp clean still life: cool water droplets on a sliced cucumber, a sprig of fresh mint, a single ice cube on white marble, soft cool blue undertone, bright clean diffused light." }

    # --- families (6 missing) ---
    @{ f = "family-aromatic.png";  p = "$style Aromatic herb still life: small bundles of fresh lavender, sage, and rosemary tied loosely on dark damp stone, with droplets of moisture. Soft window light. Cool green-purple undertones." }
    @{ f = "family-fougere.png";   p = "$style Fougere botanical still life: a damp moss-covered rock with sprigs of fern, a tuft of dried oakmoss, and freshly cut hay tied with twine, plus a sprig of lavender. Forest floor atmosphere. Deep greens and earthy amber." }
    @{ f = "family-green.png";     p = "$style Green herbaceous still life: a small lump of galbanum resin, fresh cut grass blades, violet leaves, and a single tea leaf, dewy with morning moisture. Misty, cool, green tones." }
    @{ f = "family-fruity.png";    p = "$style Fruity still life: a cracked open ripe fig, a stem of black currants with leaves, a halved peach showing skin texture, a fresh apple slice oxidizing slightly. Warm aged wood surface, soft side light. Deep purples and warm reds." }
    @{ f = "family-spicy.png";     p = "$style Spicy still life: green cardamom pods, curls of cinnamon bark, whole black peppercorns, and dried clove buds scattered on dark slate. A single warm ray of light. Earthy browns and amber." }
    @{ f = "family-leather.png";   p = "$style Leather still life: a folded piece of aged caramel-tan full grain leather with visible hand stitched edge, a curl of suede, a faint wisp of smoke drifting through warm light. Deep tobacco browns." }
)

$total = $jobs.Count
$i = 0
foreach ($j in $jobs) {
    $i++
    $out = "family_images/quiz/$($j.f)"
    if (Test-Path $out) {
        Write-Host "[$i/$total] SKIP (exists): $($j.f)"
        continue
    }
    Write-Host "[$i/$total] generating $($j.f)..."
    $resp = higgsfield generate create nano_banana_flash --prompt $j.p --aspect_ratio 4:5 --wait --wait-timeout 4m 2>&1
    $url = ($resp | Where-Object { $_ -match '^https://.+\.png$' } | Select-Object -Last 1)
    if (-not $url) {
        Write-Host "  FAILED - no URL in response"
        $resp | Select-Object -Last 5 | Write-Host
        continue
    }
    try {
        Invoke-WebRequest $url -OutFile $out -UseBasicParsing -ErrorAction Stop
        $size = [math]::Round((Get-Item $out).Length / 1024)
        Write-Host ("  OK {0} KB" -f $size)
    } catch {
        Write-Host ("  download failed: {0}" -f $_)
    }
}
Write-Host "DONE - quiz imagery batch complete."
