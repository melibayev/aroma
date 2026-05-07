# 08 — Find Your Scent (new section)

Working title (RU): **«Не знаете, какой аромат ваш?»**

## UX flow

```
Section entry (CTA card)
   │
   ▼
Step 1 — Mood / occasion        (chips: day, evening, work, date, winter…)
   │
   ▼
Step 2 — Family preference      (chips: floral, woody, citrus, gourmand…)  multi-select
   │
   ▼
Step 3 — Notes you love         (chips, drawn from chosen families)        multi-select
   │
   ▼
Step 4 — Intensity              (slider: discreet ↔ bold)
   │
   ▼
Reveal — top 3 matches          (cards: brand • name • notes • match %)
   │
   ▼
"Хотите свой 10ml?"  CTA        (short cinematic of pour into Aroma flacon)
   │
   ▼
Pick one → "Reserve in store"   (form: name, phone, preferred boutique)
```

## Visual style

- Same ivory/ink palette. Quiz lives on a `--paper` card with generous margins.
- Each step replaces in place with a fade+slide; progress dots top-right (mono).
- Chip = small mono pill, selected state = ink fill + ivory text.
- Slider = thin line with single dot, accent color.
- Reveal cards stack vertically on mobile; 3-up grid desktop.

## Match-percentage display

`Math.round(score / maxScore * 100)`. Show as `87%` in mono next to brand name.

## Cinematic pour video

Generated via Higgsfield (see [09-integrations.md](09-integrations.md)). Stored as `videos/flacon-pour.mp4`. Played muted, autoplay, loop, in the CTA card after reveal.

## Decisions (locked in)

- **Language:** RU only at launch.
- **Reservation:** phone-number capture only for v1 (simple input + submit). Booking flow added later.
- **Catalog size:** 10–15 hero picks at launch.
- **10ml refills:** every catalog perfume is refillable.
- **Quiz depth:** 7 input steps + reveal (gender, season, mood, family, notes, intensity, brands-you-like).
- **Placement:** between Families and Boutiques.
- **Persistence:** localStorage caches answers so user can re-open results.

## Final step list

1. **Gender preference** — single select: Мужской / Женский / Унисекс / Без разницы.
2. **Season** — single select: Весна / Лето / Осень / Зима / Круглый год.
3. **Mood / occasion** — multi-select chips: День, Вечер, Работа, Свидание, Особый случай, Каждый день.
4. **Family** — multi-select chips of top-level families (citrus, woody…).
5. **Notes** — multi-select, populated dynamically from chosen families.
6. **Intensity** — slider 1–5 (Сдержанно ↔ Ярко).
7. **Brands you already love** — multi-select chips, soft signal (+1 per match in scoring).

## Reveal screen

- Top 3 cards: brand • italic name • family pills • match % (mono).
- Below: editorial line *«Хотите свои 10 мл?»* + cinematic flacon-pour video (Higgsfield).
- Phone input + submit button: stores `{perfume_id, phone, ts}` in localStorage for now (later: backend).
- Confirmation toast: *«Мы позвоним в ближайшее время.»*
