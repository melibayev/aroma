# 06 — Loader

## Weighted readiness signals

| Signal | Weight | Resolves on |
|---|---|---|
| `window` | 20% | `window.load` |
| `images` | 40% | all `<img>` + `[data-img]` URLs decoded (or per-asset 6s timeout) |
| `hero` | 25% | hero video `canplaythrough` (desktop) / earliest of `loadedmetadata`/`loadeddata`/`canplay` (mobile) |
| `ritual` | 15% | first ritual frame loaded; **resolves immediately on touch** |

Progress bar uses lerp tick for smooth counter; raw signals → target → eased render.

## Timeouts

| Layer | Mobile | Desktop |
|---|---|---|
| Per-signal hard cap | 6s | 10s |
| Per-asset image cap | 6s | 6s |
| Mobile hero local fallback | 3.5s | — |
| Absolute total timeout (`launch()`) | 9s | 14s |

`appStarted` guard prevents double-fire when both an event and a timeout race.

## Why the layered safety

Mobile browsers (esp. iOS Safari) won't preload video bytes without a user gesture, so `canplaythrough` may never fire. The `loadedmetadata`/`loadeddata`/`canplay` race + 3.5s local fallback covers this.
