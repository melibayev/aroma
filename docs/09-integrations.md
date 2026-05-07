# 09 — Integrations

## Higgsfield AI — LIVE

**Status:** Authenticated as `melibayefff7@gmail.com`, Plus plan.
**Skills installed at:** `.agents/skills/`
- `higgsfield-generate` — generic image/video gen
- `higgsfield-product-photoshoot` — brand product visuals

### Setup (already done)

```bash
npm install -g @higgsfield/cli
higgsfield auth login
npx skills add higgsfield-ai/skills
```

### Model strategy (token economy)

> **Note:** the CLI's model IDs are mapped differently than the marketing names. Always use the CLI ID.
>
> | Marketing name | CLI `--model` ID |
> |---|---|
> | Nano Banana 2 | `nano_banana_flash` |
> | Nano Banana Pro | `nano_banana_2` |
> | Seedance 2.0 (video) | currently absent from `model list` — use `seedream_v5_lite` for fast, `cinematic_studio_video_v2` for quality, `kling3_0` for cheap motion. Re-check `higgsfield model list` periodically. |

| Use case | Model (CLI ID) | Why |
|---|---|---|
| **Default for images** | `nano_banana_flash` | User has unlimited Nano Banana 2 plan — saves Higgsfield credits. |
| Image-to-image edits / hard cases | `nano_banana_2` (Pro) | Only when Flash quality is insufficient. |
| Hero / family / location stills, no people | `soul_location` | Best in class for environments. Costs credits. |
| High-fidelity product hero | `gpt_image_2` | When Nano Banana 2 can't deliver. |
| **Default for videos** | `cinematic_studio_video_v2` | High-fidelity cinematic look matching site mood. |
| Cheaper motion / single-plane | `kling3_0` | Use for iteration. |
| Cinema-grade hero loop | `cinematic_studio_3_0` | One definitive hero loop only. |
| Cheap volume / batch tests | `veo3_1_lite` | Iteration only. |

**Rule:** image generation goes through `nano_banana_flash` unless quality clearly suffers. Escalate to `nano_banana_2` (Pro), then `gpt_image_2`, then `soul_location`.

### Asset workflow

1. Prompt templates in `prompts/` (committed).
2. Generate via CLI — the `higgsfield-generate` skill handles model selection.
3. Download the result, rename to a stable filename, commit it.
4. **Never reference a Higgsfield URL directly from production HTML** — always download + commit.

### Asset categories

| Category | Purpose | Filename pattern | Preferred model |
|---|---|---|---|
| Hero loops | site landing | `videos/hero-*.mp4` | `cinematic_studio_video_v2` |
| Flacon pour | Finder CTA | `videos/flacon-pour.mp4` | `cinematic_studio_video_v2` |
| Family hero | families section | `family_images/{family}.jpg` | `nano_banana_flash` |
| Product still | archive cards | `parfumes_images/{slug}.png` | `nano_banana_flash` |

## Other integrations (future)

- Phone-number reservation backend — currently localStorage only.
- Telegram bot for booking confirmations (TBD).
- Google Sheets webhook for incoming reservation forms (TBD).
