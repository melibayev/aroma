# Bottle reference photos

Drop reference photos of each perfume bottle here. Each ref should be:

- **Front-facing** (or close to it). Side and angled refs work too — Higgsfield will normalize.
- **One bottle per file**. No multi-bottle compositions.
- **Any background**. The image-to-image pipeline will replace it with the unified
  warm-beige editorial backdrop.
- **Decent resolution** (≥ 800 px on the long side; 1200 px+ ideal).
- **Clear logo/name** if possible — helps preserve brand identity.

## File naming

Filename **must match** the `id` field in [`data/perfumes.json`](../../data/perfumes.json),
followed by `.png`, `.jpg`, or `.webp`.

| `id`                              | Expected ref filename                       |
| --------------------------------- | ------------------------------------------- |
| `tom-ford-tobacco-vanille`        | `tom-ford-tobacco-vanille.png`              |
| `dior-sauvage-edp`                | `dior-sauvage-edp.png`                      |
| `versace-eros`                    | `versace-eros.png`                          |
| `chanel-coco-mademoiselle`        | `chanel-coco-mademoiselle.png`              |
| `ysl-black-opium`                 | `ysl-black-opium.png`                       |
| `mm-replica-by-the-fireplace`     | `mm-replica-by-the-fireplace.png`           |
| `le-labo-santal-33`               | `le-labo-santal-33.png`                     |
| `byredo-gypsy-water`              | `byredo-gypsy-water.png`                    |
| `creed-aventus`                   | `creed-aventus.png`                         |
| `mancera-cedrat-boise`            | `mancera-cedrat-boise.png`                  |
| `lattafa-khamrah`                 | `lattafa-khamrah.png`                       |
| `mont-blanc-legend`               | `mont-blanc-legend.png`                     |
| `jpg-le-male-le-parfum`           | `jpg-le-male-le-parfum.png`                 |
| `carolina-herrera-good-girl`      | `carolina-herrera-good-girl.png`            |
| `jo-malone-wood-sage-sea-salt`    | `jo-malone-wood-sage-sea-salt.png`          |

## What happens next

Once refs are in place, the agent runs Higgsfield Nano Banana 2 image-to-image
restyle to produce final assets in `parfumes_images/<id>.png`. Original refs
stay here untouched. The unified style:

- 4:5 portrait crop, bottle centered
- Warm beige → champagne gradient backdrop, soft vignette
- Diffused side / soft frontal light
- 85 mm equivalent, shallow depth of field, sharp glass edges
- Ultra-realistic, no harsh shadows, no text artifacts on background
- Bottle proportions and logo preserved from reference
