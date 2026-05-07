# 03 — Architecture

## File map

```
index.html              single-file site (HTML + CSS + JS)
demo.html               scratch / older version, do not edit
videos/manifest.json    list of hero videos, picked at random
videos/*.mp4            hero loop sources
frames/                 300 jpgs (ezgif-frame-001..300.jpg) for ritual canvas
parfumes_images/        archive product PNGs (loaded via data-img)
family_images/          family section imagery
newversionframes/       legacy, unused
docs/                   project memory (this folder)
```

## Runtime dependencies (CDN)

- **Lenis 1.1.13** — smooth scroll (desktop only; stubbed on touch).
- **GSAP 3.12.5** + **ScrollTrigger** — all reveals, ritual scrub, sticky panels.

No build step. No bundler. No framework. Edit `index.html` directly.

## Touch detection (canonical pattern)

```js
const isTouch = window.matchMedia('(pointer: coarse)').matches || 'ontouchstart' in window;
```

Used in 3 places: Lenis init, ritual module, hero video readiness.
