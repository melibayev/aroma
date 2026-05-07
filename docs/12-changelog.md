# 12 — Changelog

Append one line per notable change. Newest first. Format: `YYYY-MM-DD — area — change`.

---

- 2026-05-08 — finder/reveal — full visual rewrite of the 3-perfume result screen. Match badge moved out of `.profile__visual` (it was overlapping the bottle and reading as collision) into the brand row as a clean mono pill. Unified vertical rhythm via `--rev-gap / --rev-gap-md / --rev-gap-sm` CSS vars (no more clamp jungle). `.reveal__head` switched from `flex-wrap` to a deterministic 2-col grid (title + lede left, pager top-right). Note pyramid now uses internal vertical rules instead of a top border per column. Accord bars per family color (var `--accord-color`, fed by `FAMILY_COLOR` map): floral pink, woody warm brown, citrus muted gold, aquatic soft blue-grey, gourmand creamy beige, etc. CTA + pour video merged into one bordered card with no internal gap between halves. Form trimmed to baseline-aligned 3-col grid. All on-block paddings normalized.
- 2026-05-08 — assets — generated 17 unified perfume bottle stills (Nano Banana 2, image-to-image from `parfumes_images/refs/`, 4:5, ivory backdrop, soft window light). Output saved to `parfumes_images/<id>.png`. Catalog `image` paths repointed to finals (5 ref-less entries — Tom Ford Tobacco Vanille, Dior Sauvage, Byredo Gypsy Water, Creed Aventus, Mont Blanc Legend — still use legacy generics until refs are supplied). Batch script: `prompts/generate-perfume-stills.ps1`, idempotent (skips existing).
- 2026-05-08 — finder — fixed step-3 (mood) navigation: viewport had `min-height: ~520px` and steps were `position:absolute; inset:0`, so taller steps overflowed and covered `.finder__cont` (Back / Continue). Active step now goes `position:relative` so the viewport grows to fit; inactive steps stay absolute for the cross-fade. Removed mobile `min-height: 460px` override (no longer needed).
- 2026-05-08 — catalog — added 7 new perfumes (Miss Dior Chérie, Dior J'adore, Viktor & Rolf Flowerbomb, Giorgio Armani My Way, D&G Light Blue Eau Intense, Gucci Flora Gorgeous Gardenia, Prada Paradoxe). Re-pointed image paths to existing files in `parfumes_images/refs/` (real product shots) until Higgsfield restyle finals are produced. Catalog: 15 → 22 entries. Versace Eros entry refined to *Eros Flame* to match the supplied ref.
- 2026-05-07 — assets — generated `videos/flacon-pour.mp4` (Kling 3.0, 5s 9:16) used by Finder reveal CTA, and `videos/hero-aroma.mp4` (Cinematic Studio Video V2, 6s 16:9). Manifest weighted to play hero-aroma 3× more often. Prompts in `prompts/` rewritten as ASCII-safe concise format to avoid PowerShell encoding issues.
- 2026-05-07 — integrations — Higgsfield CLI authenticated (Plus plan). Skills `higgsfield-generate` + `higgsfield-product-photoshoot` installed at `.agents/skills/`. Locked in: Nano Banana 2 default for images (unlimited plan), Seedance 2.0 default for videos. Updated docs/09 + docs/10 with model strategy.
- 2026-05-07 — finder — added «Подбор» section (7-step quiz + 3-card reveal + phone reservation). New `data/perfumes.json` with 15 launch picks. Renumbered sections: Boutiques 05→06, Contacts 06→07. New `#finder` link in nav + side-index + active-link map.
- 2026-05-07 — find-your-scent — decisions locked: RU only, phone-only reservation, 10–15 picks, all refillable, 7-step quiz, between Families & Boutiques, localStorage persistence.
- 2026-05-07 — docs — initialized `docs/` project memory system (12 files).
- 2026-05-06 — ritual — hidden on mobile (`display:none` ≤900px); JS preload short-circuits on touch.
- 2026-05-06 — loader — 4-layer mobile safety: per-signal cap, per-asset cap, mobile hero events race + 3.5s fallback, absolute total timeout, `appStarted` guard.
- 2026-05-06 — animations — Lenis stubbed on touch; ritual pin disabled on touch (later: hidden entirely).
- 2026-05-05 — archive — mobile compact card row (num / italic name+meta / 56×70 thumb via `--thumb` CSS var).
- 2026-05-05 — hero — forced edge-to-edge bleed on mobile via `100vw` + negative margin.
- 2026-05-05 — footer — bottom padding `clamp(80px, 10vh, 120px)` to clear Windows taskbar.
- 2026-05-04 — families — runtime split into 3 panels (Title / Récit / Composition) with sticky image.
