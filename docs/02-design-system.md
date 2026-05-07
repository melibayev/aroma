# 02 — Design System

## Palette

| Token | Value | Use |
|---|---|---|
| `--ivory` | `#EFE9E0` | Base background |
| `--paper` | `#F4EFE7` | Card / inset surface |
| `--ink` | `#0E0E0E` | Primary text |
| `--mute` | `#7A746B` | Secondary text, meta |
| `--accent` | `#C0421F` | Burnt sienna — single accent only |

Ritual section uses a separate gradient: `linear-gradient(180deg, #F2ECE2 0%, #E8DFD0 100%)`.

## Typography

- Serif: **Fraunces** (italic 300, roman 300/400 occasionally). Used for headlines + emotional lines.
- Mono: **JetBrains Mono** 11–12px, letter-spacing `.18em–.2em`, uppercase. Used for labels, meta, step counters.
- Sizes scale with `clamp()`. Hero italic uses `clamp()` keyed to viewport height to prevent overflow.

## Spacing

- `--pad-x`: horizontal section padding (responsive).
- Sections: `clamp(120px, 18vh, 200px) var(--pad-x)` desktop; `clamp(80px, 12vh, 120px)` mobile.
- Footer bottom: `clamp(80px, 10vh, 120px)` to clear Windows taskbar.

## Motion

- Easing: GSAP defaults + Lenis lerp `0.075`, duration `1.6` (desktop only).
- Reveals: `.anim` opt-in class, `once: true` triggers.
- Cursor: custom dot+ring (desktop). Hidden on touch.

## Component conventions

- All sections wrap content in a `__shell` or `__grid` element.
- Section number labels via `.section-num` (mono, with leading bar).
- Headlines combine roman + `.italic` + `.acc` (accent color).
