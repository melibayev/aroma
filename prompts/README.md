# Prompt templates

Templates for generating Aroma Parfum visual assets via Higgsfield CLI.

## Files

- [flacon-pour.txt](flacon-pour.txt) — 4–6s pour video for the «Подбор» CTA. Model: `cinematic_studio_video_v2`.
- [hero-loop.txt](hero-loop.txt) — 6–8s atmospheric hero loop. Model: `cinematic_studio_video_v2`.
- [product-still.txt](product-still.txt) — replace `{{NAME}}`. Model: `nano_banana_flash`.
- [family.txt](family.txt) — replace `{{FAMILY}}` with one of `citrus / aromatic / fougère / green / floral / fruity / gourmand / spicy / woody / amber / leather / aquatic`. Model: `nano_banana_flash`.

## Generation pattern

```bash
# image (default — uses unlimited Nano Banana 2 plan)
higgsfield generate create nano_banana_flash \
  --prompt "$(cat prompts/family.txt | sed 's/{{FAMILY}}/woody/g')" \
  --aspect_ratio 4:5 \
  --wait

# video
higgsfield generate create cinematic_studio_video_v2 \
  --prompt "$(cat prompts/flacon-pour.txt)" \
  --duration 6 \
  --aspect_ratio 4:5 \
  --wait
```

After generation: download the result, save into `family_images/`, `parfumes_images/`, or `videos/` with a stable name, commit it. **Never hot-link Higgsfield URLs from `index.html`.**
