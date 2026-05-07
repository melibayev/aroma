# 10 — Prompt Engineering

All prompt templates live as text files in `prompts/`.

## Conventions

- One file per asset type. Keep prompts deterministic (same params = same vibe).
- Prefix every prompt with the brand mood block (see below).
- Always include negative prompt: `no text, no logo, no watermark, no people unless specified`.
- Default image model: `nano_banana_flash` (= Nano Banana 2, unlimited plan). Default video model: `cinematic_studio_video_v2`.

## Brand mood block (prepend to all visual prompts)

> Editorial luxury perfumery, Aesop × Maison Margiela aesthetic. Ivory and warm ink palette with a single burnt sienna accent (#C0421F). Soft directional natural light, matte surfaces, restrained composition, film grain, 35mm. Quiet, slow, intimate. Negative: no text, no logo, no watermark.

## Templates (committed in `prompts/`)

- `prompts/hero-loop.txt` — 6–8s cinematic hero loops (`cinematic_studio_video_v2`).
- `prompts/flacon-pour.txt` — 4–6s loop of liquid pouring into a 10ml branded Aroma flacon (`cinematic_studio_video_v2`).
- `prompts/family-{name}.txt` — one per family (`nano_banana_flash`).
- `prompts/product-still.txt` — silver-on-ivory product photography (`nano_banana_flash`).

## Video specs

- 1920×1080, 24fps, 4–8s, MP4 (H.264), under 4 MB ideally.
- Always preview muted; design copy assuming no audio.

## Generation pattern

```bash
# image (default — uses unlimited Nano Banana 2 plan)
higgsfield generate create nano_banana_flash \
  --prompt "$(cat prompts/family.txt)" \
  --aspect_ratio 4:5 \
  --wait

# video
higgsfield generate create cinematic_studio_video_v2 \
  --prompt "$(cat prompts/flacon-pour.txt)" \
  --duration 6 \
  --aspect_ratio 4:5 \
  --wait
```

Download the result URL into the right folder, rename, commit.
