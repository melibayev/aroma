# Aroma Parfum — Project Memory

This folder is the single source of truth for the project. **Update the relevant file after every meaningful change.** Keep entries short, factual, dated.

## Index

1. [01-overview.md](01-overview.md) — what this site is, audience, tone, business goal
2. [02-design-system.md](02-design-system.md) — colors, type, spacing, motion, components
3. [03-architecture.md](03-architecture.md) — file map, build, dependencies, runtime
4. [04-sections.md](04-sections.md) — every page section, behavior, mobile/desktop differences
5. [05-animation-logic.md](05-animation-logic.md) — Lenis, GSAP, ScrollTrigger, ritual frames, touch rules
6. [06-loader.md](06-loader.md) — readiness signals, timeouts, fallbacks
7. [07-perfume-database.md](07-perfume-database.md) — schema for the recommender
8. [08-find-your-scent.md](08-find-your-scent.md) — quiz UX flow, note taxonomy, matching algorithm
9. [09-integrations.md](09-integrations.md) — Higgsfield (CLI + skills), how we generate assets
10. [10-prompt-engineering.md](10-prompt-engineering.md) — image/video prompt templates
11. [11-roadmap.md](11-roadmap.md) — what's next, parked ideas
12. [12-changelog.md](12-changelog.md) — dated diff of every notable change

## Rules

- One change → update the relevant file + append one line to `12-changelog.md`.
- Don't duplicate facts across files; link instead.
- Mobile and desktop behavior must always be documented together.
- If a fix is non-obvious (e.g. iOS Safari quirk), record the *why*, not just the *what*.
