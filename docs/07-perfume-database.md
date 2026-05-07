# 07 — Perfume Database

Lives in `data/perfumes.json`. Current catalog: **22 entries**. Image paths point to real product shots in `parfumes_images/refs/` until Higgsfield restyle finals are produced (target unified 4:5 warm-beige editorial backdrop).

## Proposed schema

```jsonc
{
  "id": "tom-ford-tobacco-vanille",
  "brand": "Tom Ford",
  "name": "Tobacco Vanille",
  "year": 2007,
  "gender": "unisex",          // "men" | "women" | "unisex"
  "concentration": "EDP",      // "EDT" | "EDP" | "Parfum" | "Extrait"
  "families": ["amber", "spicy", "gourmand"],
  "notes": {
    "top":    ["tobacco leaf", "spices"],
    "heart":  ["tonka bean", "tobacco blossom"],
    "base":   ["vanilla", "cocoa", "dry fruits"]
  },
  "vibe": ["warm", "smoky", "evening", "winter"],
  "intensity": 4,              // 1–5 sillage/projection
  "longevity": 5,              // 1–5 hours bracket
  "season": ["fall", "winter"],
  "image": "/parfumes_images/tom-ford-tobacco-vanille.png",
  "available_10ml": true,
  "price_10ml_uzs": 220000
}
```

## Note taxonomy (top level — used by quiz)

`citrus`, `aromatic`, `fougère`, `green`, `floral`, `fruity`, `gourmand`, `spicy`, `woody`, `amber`, `leather`, `musky`, `aquatic`, `powdery`, `oud`, `tobacco`.

Each top-level family has a curated list of mid-level descriptors shown in the quiz.

## Matching algorithm (v1)

Score each perfume against user selections:

1. **Family match:** +3 per overlapping family.
2. **Note match:** +1 per overlapping mid-level note.
3. **Vibe/season match:** +1 each.
4. **Penalty:** −2 if user picks "fresh/light" but perfume `intensity ≥ 4`.

Return top 3 by score, sorted descending. Tie-break by `year DESC`.
