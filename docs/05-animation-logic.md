# 05 — Animation Logic

## Lenis (desktop only)

- `duration: 1.6`, `lerp: 0.075`.
- On touch: replaced with a no-op stub exposing `raf/start/stop/on/scrollTo`. `scrollTo` falls back to `window.scrollTo({behavior:'smooth'})`.
- **Why:** Lenis fights native momentum + sticky on iOS, causing snap-back.

## ScrollTrigger usage

- Section reveals use `start: 'top 80%'`, `once: true`.
- No `scrub` on touch except where explicitly safe.
- **Never** pin on touch — mobile URL-bar resize triggers `invalidateOnRefresh` and rubber-bands the page.

## Ritual canvas (desktop only)

- 300 frames, weighted preload: first frame → every 8th → fill remainder in batches of 24.
- Pin `.ritual__sticky` for `4 × innerHeight`, scrub a frame index.
- On touch: module short-circuits at top — no preload, no triggers.

## Families panels

- Each `.fam` body cloned into 3 `.fam__panel` divs (Title / Récit / Composition) at runtime.
- Image is `position: sticky` while text scrolls past on desktop.
- Mobile: stacked, each panel fades up via IntersectionObserver-style trigger.

## Reduced motion

- `prefers-reduced-motion: reduce` kills ritual scrub, shows static frame, sets steps statically.
