# 04 — Sections

Order in DOM:

1. **Hero** — fullscreen looping video (random from `videos/manifest.json`), italic headline overlay. `100dvh` mobile, edge-to-edge bleed.
2. **Manifesto** — short editorial copy + meta block.
3. **Archive** — product grid. Desktop: hover preview. Mobile: 3-column compact card row (num / italic name+meta / 56×70 thumb).
4. **Ritual** — 300-frame canvas scrub with sticky pin (desktop only, 4× viewport). **Hidden on mobile** (`display:none` ≤900px); JS short-circuits frame preload on touch.
5. **Families** — sticky-image + scrolling-text storytelling. Each family's body splits at runtime into 3 panels (Title / Récit / Composition). Stacked on mobile.
6. **Boutiques** — locations.
7. **Contact** — addresses, hours, CTA.
8. **Footer** — credits, padded clear of Windows taskbar.

## Mobile vs desktop summary

| Section | Desktop | Mobile (≤900px) |
|---|---|---|
| Hero | full bleed video | `100dvh`, forced `100vw` bleed |
| Archive | hover preview | compact card list |
| Ritual | pinned scrub 4×vh | hidden entirely |
| Families | sticky image, scrolling panels | stacked, panel reveals |
| Cursor | custom dot+ring | hidden |
| Lenis | active | stubbed (native scroll) |
