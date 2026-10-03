# AI UI/UX Design Intelligence Knowledge Base
## A decision engine for AI coding agents, website builders, and design-generation skills
**Edition:** October 2026 (revised: v2 - issues fixed, foundations/UX/legal/localization/platform sections and extra industry presets added)
**Purpose:** Give an AI agent a structured design vocabulary, selection method, style catalogue, animation catalogue, industry presets, implementation guidance, and quality gates so it can choose a suitable design system for each project instead of applying one generic aesthetic everywhere.

> This is an AI-facing operating reference, not a textbook. It is designed to be supplied as context to an AI coding/design tool. It is a curated, extensible catalogue—not a claim that every style ever invented is listed. Treat trends as options, not requirements. User goals, content, accessibility, performance, and evidence outrank novelty.

---

# PART A — OPERATING INSTRUCTIONS FOR THE AI

## 1. Role
Act as a senior product designer, UX researcher, visual design director, motion designer, accessibility specialist, and design-systems engineer. Before producing UI, infer or establish the product's purpose, audience, domain, brand, platform, content density, risk level, conversion goal, and technical constraints. Make a coherent set of decisions; do not randomly combine trendy effects.

## 2. Non-negotiable priority order
1. User task completion, safety, clarity, trust, and accessibility.
2. Product/domain requirements, audience expectations, and platform conventions.
3. Information architecture, content hierarchy, responsive behaviour, and state coverage.
4. Brand differentiation and visual quality.
5. Decorative trends and experimental effects.

Never sacrifice legibility, discoverability, keyboard operation, mobile usability, performance, privacy, or truthful communication for visual style.

**Explicit instructions:** follow the user's explicit requests, existing brand guidelines, and existing design system unless doing so would create an accessibility, safety, legal, or serious usability failure. When that happens, flag the trade-off in one or two sentences, propose an alternative that preserves the user's intent, and proceed with the safest reasonable option.

## 3. Required design-selection workflow
Run this workflow before implementing a substantial page or app.

### Step 1 — Build a project profile
Extract:
- Product type and industry.
- Primary audience and their level of expertise.
- Primary user job and business goal.
- Primary conversion/action.
- Brand traits: e.g. trustworthy, clinical, playful, premium, rebellious, calm, technical.
- Risk level: low, medium, high, safety-critical/regulated.
- Content density: low, medium, high, very high.
- Platform: responsive web, mobile web, native iOS, Android, dashboard, kiosk, immersive/3D.
- Existing brand assets, design system, and user preferences.
- Performance constraints, devices, network conditions (assume mid-range mobile on a slow connection if unknown), localization (languages, scripts, reading direction, currency, date/number formats), and accessibility needs.
- Content readiness: real copy, imagery, and data available vs placeholders; who maintains content after launch.
- Required pages, flows, and states.

If key information is missing, make conservative assumptions, label them, and proceed when reasonable. Ask questions only when an unknown materially changes the design.

### Step 2 — Choose a design direction
Choose:
- One primary visual style.
- Zero to two supporting style influences.
- One layout strategy.
- A semantic colour system.
- A typography system.
- A spacing/grid system.
- Component shapes, borders, shadows, elevation, and density.
- Motion principles and a motion budget.
- Image/illustration/icon strategy.
- Light/dark mode decision.
- Responsive behaviour.

Do not use every style. Do not add glass, gradients, 3D, parallax, blur, glow, or animated backgrounds by default.

### Step 3 — Score candidate directions
Rate each candidate 1–5 and apply the weights below. Use evidence and project fit rather than personal taste.

| Criterion | Weight |
|---|---:|
| User/task clarity and usability | 25% |
| Industry/audience fit and trust | 20% |
| Brand distinctiveness | 15% |
| Accessibility and readability potential | 15% |
| Content/layout fit | 10% |
| Performance and implementation fit | 10% |
| Maintainability/design-system fit | 5% |

Weighted score = sum(score × weight). A strong aesthetic fit cannot compensate for a serious accessibility or safety failure. Treat scoring as a decision aid, not scientific measurement. Reject any direction that fails hard constraints.

### Step 4 — Explain the choice internally in the design brief
Record:
- Selected style and why it fits.
- Rejected alternatives and why they are weaker.
- Where each visual effect is used and where it is deliberately not used.
- Accessibility/performance risks and mitigations.
- Motion choices and reduced-motion alternatives.
- Assumptions requiring validation.

### Step 5 — Design before code
Create or reason through:
1. Information architecture and sitemap.
2. Primary user flows and key decisions.
3. Page-level hierarchy and layout.
4. Design tokens.
5. Reusable component inventory.
6. Component states.
7. Responsive rules.
8. Motion specification.
9. Empty/loading/error/offline/success states.
10. Accessibility and QA checklist.

### Step 6 — Validate the rendered product
Inspect the actual implementation, not only the prompt or mockup. Check desktop, mobile, intermediate widths, keyboard/focus, contrast, content overflow, interaction states, loading/error states, animation performance, and consistency. Fix high-impact problems before micro-polish.

## 4. AI design anti-patterns
Avoid:
- Generic purple/pink gradient + glowing blobs + glass cards for every AI/SaaS site.
- Excessive rounded cards nested inside rounded cards.
- Huge hero typography that pushes useful content below the fold without purpose.
- Decorative charts with fake data.
- Tiny low-contrast labels.
- Unlabelled icon-only actions.
- Hover-only interaction.
- Scroll-jacking, mandatory long animations, and gratuitous parallax.
- Auto-playing sound or distracting motion.
- Randomly mixing neumorphism, glassmorphism, brutalism, skeuomorphism, and editorial styles.
- Replacing usability with aesthetic novelty.
- Copying a competitor's brand, exact composition, illustrations, or identity.
- Treating a trend as a design system.
- Designing only the happy path.
- Claiming accessibility compliance based only on automated checks.
- Inventing research findings, testimonials, business facts, or performance metrics.

## 5. Output format expected from the AI
Before or alongside implementation, produce a concise Design Decision Record:
- Project profile.
- Chosen design direction.
- Style mix and usage boundaries.
- Colour and type direction.
- Layout and component strategy.
- Motion system.
- Responsive approach.
- Content and localization approach.
- Accessibility safeguards.
- Performance safeguards.
- Key assumptions.
- Validation plan.

---

# PART B — DESIGN STYLE CATALOGUE

A style is a visual language. A layout pattern is how content is arranged. A design system is the reusable rules/components/tokens. These are related but not interchangeable.

For each style below, the AI should assess fit, audience, accessibility, implementation effort, and whether it supports the actual task.

## 6. Core, established, and functional styles

### 6.1 Swiss / International Typographic
**Signals:** strict grid, strong typography, asymmetry, clean alignment, limited ornament.
**Fits:** professional services, architecture, editorial, culture, B2B, portfolios.
**Avoid/modify:** when warmth, playfulness, or highly tactile guidance is essential.
**Motion:** restrained fades, simple reveals, deliberate grid transitions.

### 6.2 Minimalism
**Signals:** few elements, whitespace, restrained palette, low ornament.
**Fits:** premium brands, focused tools, editorial, simple landing pages.
**Risks:** removing labels, affordances, useful context, or navigation in the name of “clean.”
**Rule:** minimal UI must still communicate function.

### 6.3 Flat Design
**Signals:** simple surfaces, little depth, solid colour, crisp geometry.
**Fits:** lightweight interfaces, clear content products, broad consumer products.
**Risks:** clickable elements can become ambiguous if signifiers are weak.

### 6.4 Semi-flat / Flat 2.0
**Signals:** simple shapes with subtle shadows, gradients, and depth cues.
**Fits:** general-purpose web/app UI; safe baseline when context is unknown.
**Risks:** generic appearance without distinctive typography, composition, imagery, or brand details.

### 6.5 Material Design / Material 3
**Signals:** structured components, elevation, motion, adaptive colour, established interaction patterns.
**Fits:** Android, cross-platform apps, forms, consumer and productivity products.
**Risks:** blindly applying system components when brand/platform needs differ.

### 6.6 Fluent-inspired
**Signals:** layered surfaces, light, depth, motion, productivity-oriented components.
**Fits:** enterprise tools, Windows-oriented products, collaboration/productivity software.
**Risks:** overusing acrylic/transparency where content clarity is critical.

### 6.7 Human Interface / platform-native
**Signals:** native platform conventions, expected controls, navigation, typography, and gestures.
**Fits:** native iOS/macOS/visionOS products.
**Rule:** use current official platform guidance; do not imitate native appearance with broken web semantics.

### 6.8 Corporate / Enterprise
**Signals:** predictable hierarchy, clear tables/forms, restrained brand palette, robust states.
**Fits:** B2B, administration, internal tools, regulated workflows.
**Risks:** dullness or dense screens; prioritize task efficiency and clarity.

### 6.9 Editorial / Magazine
**Signals:** strong typographic hierarchy, columns, pull quotes, image-led storytelling.
**Fits:** publishers, journalism, culture, blogs, thought leadership, brand stories.
**Risks:** decorative layouts can obscure scanning or responsive reading.

### 6.10 Data-dense / Analytical
**Signals:** compact grids, tables, filters, clear units, chart hierarchy, contextual detail.
**Fits:** analytics, finance, operations, logistics, admin dashboards.
**Rules:** prioritize comparison and comprehension; include labels, scales, time ranges, data freshness, empty states, and accessible alternatives.

## 7. Expressive, tactile, and trend-led styles

### 7.1 Skeuomorphism
**Signals:** visual materials and controls that resemble real-world objects.
**Fits:** musical instruments, creative tools, education, familiar object metaphors.
**Risks:** heavy textures, dated visuals, literal metaphors that do not match digital behaviour.
**Use selectively** for meaningful affordance, not every component.

### 7.2 Neumorphism / Soft UI
**Signals:** same-colour surfaces, soft inset/extruded shadows.
**Fits:** experimental concept work, low-risk decorative widgets, selected ambient controls.
**Risks:** weak contrast and unclear clickability. **Do not use as the sole interaction cue.**

### 7.3 Glassmorphism
**Signals:** translucent surfaces, backdrop blur, thin highlights/borders, layered depth.
**Fits:** overlays, media controls, spatial contexts, selected premium hero elements.
**Risks:** unreadable text over complex backgrounds, blur cost, poor contrast, overuse.
**Rule:** use opaque fallback, verify text and component contrast, keep critical forms readable.

### 7.4 Liquid Glass / translucent spatial UI
**Signals:** fluid translucent layers, refraction-like highlights, floating surfaces.
**Fits:** platform-specific spatial experiences or carefully scoped premium elements.
**Risks:** implementation mismatch, distraction, low contrast, heavy rendering. Use official platform patterns where applicable; do not equate a CSS blur with a native system material.

### 7.5 Neobrutalism
**Signals:** thick dark borders, hard shadows, bold typography, bright blocks, raw geometry.
**Fits:** creator tools, playful startups, youth brands, indie products, expressive portfolios.
**Risks:** visual fatigue, weak hierarchy, inappropriate tone for sensitive contexts.

### 7.6 Brutalism / Anti-design
**Signals:** intentionally raw layouts, exposed structure, unconventional typography, deliberate rule-breaking.
**Fits:** experimental art, culture, portfolios, campaigns with a strong point of view.
**Risks:** usability and accessibility issues; never make basic tasks unnecessarily difficult.

### 7.7 Claymorphism
**Signals:** puffy 3D-like forms, rounded volumes, soft shadows.
**Fits:** friendly education, playful onboarding, lightweight consumer experiences.
**Risks:** childish tone, large asset weight, unclear affordances.

### 7.8 3D / Spatial / Immersive
**Signals:** depth, perspective, object manipulation, spatial transitions.
**Fits:** product configurators, architecture, 3D products, games, spatial computing, high-impact storytelling.
**Risks:** device performance, motion sensitivity, loading cost, input complexity. Provide a usable non-3D path.

### 7.9 Y2K / Retro-futurism
**Signals:** chrome, iridescence, pixel motifs, playful digital nostalgia.
**Fits:** music, fashion, creator culture, campaign microsites.
**Risks:** novelty overwhelming product information; ensure type and contrast remain strong.

### 7.10 Retro / Vintage
**Signals:** period typography, aged palette, print textures, nostalgic imagery.
**Fits:** craft, food, hospitality, heritage brands, editorial stories.
**Risks:** illegibility and accidental imitation of a period without brand relevance.

### 7.11 Memphis / Geometric Play
**Signals:** bold geometric shapes, playful patterns, colour blocking.
**Fits:** creative studios, events, education, youth-facing campaigns.
**Risks:** busy layouts and visual competition.

### 7.12 Organic / Natural / Earthy
**Signals:** warm neutrals, organic shapes, natural imagery, tactile materials.
**Fits:** wellness, sustainable products, food, lifestyle, community brands.
**Risks:** unsubstantiated eco claims or stereotypical visual shorthand.

### 7.13 Aurora / Gradient-led
**Signals:** blended colour fields, atmospheric glow, luminous gradients.
**Fits:** creative technology, product launches, selected hero sections.
**Risks:** visual sameness, contrast problems, GPU cost. Use as accent, not default content background.

### 7.14 Dark / High-contrast Technical
**Signals:** dark surfaces, crisp type, restrained accent colours, fine borders.
**Fits:** developer tools, creative software, media, monitoring dashboards.
**Risks:** eye strain from excessive contrast, low-contrast secondary text, poor print/light-mode support.

### 7.15 Luxury / Quiet Luxury
**Signals:** disciplined whitespace, editorial type, material photography, muted palette, careful detail.
**Fits:** premium fashion, jewellery, hospitality, architecture, high-end services.
**Risks:** low-contrast thin text, vague navigation, overuse of empty space, slow image-heavy pages.

### 7.16 Maximalism
**Signals:** layered graphics, dense colour, rich imagery, expressive type.
**Fits:** culture, music, fashion campaigns, creative portfolios.
**Risks:** weak task hierarchy and overwhelming sensory load.

### 7.17 Neo-futurism / Techno
**Signals:** angular geometry, technical grids, luminous accents, precise typography.
**Fits:** robotics, gaming, engineering, cybersecurity, futuristic product campaigns.
**Risks:** cliché neon, low legibility, style over substance.

### 7.18 Glass + Editorial Hybrid
**Signals:** strong typography and editorial grid with glass reserved for a few overlays.
**Fits:** premium technology storytelling, product launch pages.
**Rule:** content surfaces remain readable and stable.

### 7.19 Warm Minimal / Soft Friendly
*(Not the same as 7.2 Neumorphism / Soft UI: this style uses flat or lightly elevated surfaces with warm colour, not extruded same-colour shadows.)*
**Signals:** warm backgrounds, restrained contrast hierarchy, rounded but not excessive forms, natural imagery.
**Fits:** wellness, consumer utilities, thoughtful SaaS, lifestyle.
**Risks:** low contrast and generic “friendly app” appearance.

### 7.20 High-contrast Utility
**Signals:** explicit labels, strong borders, clear controls, limited decoration.
**Fits:** accessibility-first services, emergency workflows, public services, complex forms.
**Risks:** can feel utilitarian; improve tone through typography and content rather than weakening clarity.

## 8. Layout and composition patterns (not visual styles)
These may be paired with many visual styles.

- **Bento grid:** modular cards of varying sizes; good for feature summaries and product overviews. Not ideal for every content page.
- **Single-column editorial:** reading-first, clear line length.
- **Split-screen:** two complementary zones; common in hero sections and sign-in flows.
- **Asymmetric grid:** expressive, editorial, portfolio layouts.
- **Card grid:** repeated comparable items; ensure cards do not become nested-card clutter.
- **Dashboard shell:** sidebar/top bar + workspace + detail panel.
- **Master-detail:** list/table and selected detail; useful for inboxes and admin tools.
- **Timeline:** chronology, progress, history.
- **Wizard / stepper:** complex sequential tasks; support back/edit and clear progress.
- **Full-screen immersive:** media, story, 3D; provide exits and reduced-motion alternatives.
- **Map-first:** location workflows; ensure list/search alternatives and accessible controls.
- **Search-first:** catalogues, documentation, knowledge bases.
- **Feed-based:** social/media products; support context, moderation, loading and empty states.
- **Canvas/workbench:** creation tools, editors, whiteboards; prioritize shortcuts, selection, undo, and discoverability.
- **Table-first:** operations and data management; preserve scanability, sort/filter clarity, and responsive strategy.
- **Form-first:** booking, application, checkout; minimize fields and support recovery.
- **Long-form conversion page:** problem, benefits, proof, details, objections, CTA; avoid deceptive urgency.
- **Storytelling scroll:** narrative progression; do not hijack scrolling or trap users in effects.
- **Layered floating panels:** useful for spatial tasks; manage z-index, overlap, focus, and touch.
- **Minimal landing page:** one core proposition and one primary action; do not confuse minimal with content-free.

## 9. Surface, shape, and decorative treatment vocabulary
Use these as controlled tokens, not random effects:
- Flat solid surface
- Subtle elevation
- Hard shadow
- Soft shadow
- Inset shadow
- Outline/bordered surface
- Frosted glass/translucency
- Gradient surface
- Mesh gradient
- Duotone image treatment
- Grain/noise texture
- Paper/print texture
- Halftone/pixel texture
- Metallic/chrome treatment
- Neon glow
- Ambient glow
- Outline typography
- Oversized display type
- Monospaced/technical type
- Serif/sans contrast
- Organic blob shapes
- Geometric pattern
- Cut-out/collage
- Image mask/crop
- Isometric illustration
- 3D product render
- Lottie/Rive illustration

Data visualization and icon-led interfaces are covered as their own topics in Part F, not as decoration.

**Selection rule:** every treatment must support hierarchy, identity, explanation, or emotion. If it competes with the primary task, remove or reduce it.

---

# PART C — INDUSTRY / PRODUCT PRESETS

These are starting hypotheses, not hard rules. Confirm the brand, audience, region, and task.

### Quick-reference matrix (starting points only)
| Domain | Style candidates | Layout strategy | Motion level | Biggest risk to manage |
|---|---|---|---|---|
| Clinic / healthcare | Semi-flat, restrained corporate | Hero -> services -> doctors -> booking | 0-2 | Trust, contrast, emergency info |
| Patient portal / health data | Utility-first, high-contrast utility | Dashboard shell, master-detail | 0-1 | Colour-only status, errors |
| Luxury fashion / jewellery | Quiet luxury, editorial minimal | Campaign hero, curated grid | 2-3 | Slow images, hidden price/returns |
| Streetwear / Gen Z | Neobrutalism, Y2K, editorial | Asymmetric grid, product-first | 2-3 | Style over purchase flow |
| SaaS marketing | Semi-flat, Swiss, technical | Long-form conversion page | 2-3 | Generic AI look, fake proof |
| SaaS app / admin | Corporate/utility, data-dense | Dashboard shell, table-first | 1-2 | Density vs clarity, destructive actions |
| Fintech / banking | High-trust utility | Form-first, table-first | 0-2 | Misleading charts, dark patterns |
| Education | Friendly structured, flat | Course tree, progress | 1-2 | Colour-only feedback, distraction |
| Restaurant / food ordering | Warm editorial, organic | Menu-first, cart | 1-2 | Slow hero video, hidden fees |
| Hotel / travel | Editorial, warm premium | Search/booking-first | 1-2 | Hidden fees, parallax over booking |
| Developer tools | Dark technical, utility | Search-first, workbench | 1-2 | Low-contrast grey text, neon |
| Gaming / esports / music | Expressive, neo-futurist, dark | Immersive + schedule/list | 2-3 | Hover-only controls, loud autoplay |
| Government / nonprofit | High-contrast utility | Content-first, wizard | 0-1 | Jargon, lost form data |
| E-commerce | Clean semi-flat, editorial | Catalogue, search-first | 1-2 | Fake scarcity, hidden costs |
| Reading / comics / publishing | Editorial, reading-first | Feed + reader | 0-2 | Reading comfort, image weight |

## 10. Medical clinic / hospital / health service
**Primary needs:** trust, calm, clarity, accessibility, appointment completion, service and doctor information.
**Recommended baseline:** high-clarity semi-flat or restrained corporate; white/light neutral surfaces; calm blue/teal/green accents only when brand-appropriate; readable sans-serif; clear appointment CTA; service cards or structured lists; clinician credentials and fees easy to find.
**Layout:** clear hero → services → doctors/specialties → appointment flow → location/hours/contact → FAQs.
**Motion:** short fade/slide, subtle status transitions; no distracting 3D or parallax around clinical information.
**Avoid:** low-contrast glass cards for medical details, fake medical claims, excessive animation, hard-to-find emergency guidance.
**Must include:** accessibility, privacy, consent, secure form states, error recovery, mobile tap usability, explicit appointment confirmation.
**Possible variant:** premium specialist practice may use editorial photography and elegant type while keeping practical information prominent.

## 11. Healthcare dashboard / patient portal
**Baseline:** utility-first, structured data, clear status and next actions.
**Priorities:** readable data, permission boundaries, appointment state, medication/test-result labels, auditability, error prevention.
**Avoid:** ambiguous colour-only status, playful gimmicks, unnecessary motion.

## 12. Premium fashion / clothing / jewellery
**Baseline:** quiet luxury or editorial minimalism; large authentic product imagery; refined type pairing; restrained palette; generous but purposeful spacing.
**Layout:** campaign hero → curated collection → product details → material/fit/size → shipping/returns → trust proof.
**Motion:** image reveal, subtle parallax only if performant, product hover swap, controlled gallery transitions.
**Avoid:** generic dashboard cards, too many gradients, weak product photography, hiding price/fit/returns, autoplay video that blocks browsing.
**Must include:** mobile product gallery, size guide, variant states, stock status, clear checkout and return policy.

## 13. Streetwear / Gen Z fashion
**Baseline:** editorial, expressive, brutalist/neo-brutalist accents or Y2K if brand evidence supports it.
**Motion:** snappy hover/tap, short reveal, kinetic typography used sparingly.
**Avoid:** copying a trend unrelated to the brand; prioritise product details and purchase flow.

## 14. SaaS marketing website
**Baseline:** modern semi-flat, editorial/Swiss, or brand-specific technical style.
**Layout:** clear value proposition → proof → benefits/use cases → product demonstration → pricing/FAQ → CTA.
**Motion:** restrained hero motion, product UI demo, scroll reveals with reduced-motion support.
**Avoid:** default AI gradient aesthetic, fake dashboard screenshots, meaningless animated blobs.

## 15. SaaS application / admin dashboard
**Baseline:** high-clarity utility-first system, neutral surfaces, consistent spacing, strong typography.
**Layout:** navigation shell, contextual page title, filters, primary action, data/table/cards, detail view.
**Motion:** state transitions, skeletons, drawers, layout transitions only when they clarify relationships.
**Avoid:** oversized marketing hero elements inside task-focused workspace; overusing glass and shadows.
**Must include:** permissions, empty/loading/error states, keyboard support, responsive data density, destructive-action protection.

## 16. AI product / AI assistant
**Baseline:** product-specific visual identity; conversational interface only when conversation is the right interaction model.
**Use:** clear prompt affordance, examples, progress, citations/provenance where relevant, editable output, retry/undo, confidence/limitations when important.
**Motion:** streaming text, progress/status, restrained generated-content reveal.
**Avoid:** fake thinking indicators, unsupported claims, purple gradient + glass as default, hiding user control, pretending generated output is always correct.

## 17. Restaurant / café / food ordering
**Baseline:** appetite-led imagery, warm or brand-led palette, readable menu, prices and availability, location/hours, clear order/booking CTA.
**Layout:** menu categories, item details, dietary/allergen information where available, cart, checkout, order status.
**Motion:** subtle image transitions, cart feedback, order progress.
**Avoid:** slow hero video, tiny menu type, unclear fees, missing sold-out/failed-payment states.

## 18. Hotel / hospitality / travel
**Baseline:** editorial photography, calm premium layout or warm human-centred design.
**Must show:** location, dates, availability, full costs, inclusions, cancellation terms, room details, accessibility information.
**Motion:** gallery transitions, map interactions, booking progress.
**Avoid:** hiding mandatory fees or cancellation terms, parallax that makes booking harder.

## 19. Education / LMS
**Baseline:** friendly, structured, readable, progress-oriented; playful accents only when age and context fit.
**Must show:** learning objective, course/module structure, progress, feedback, accessible media and next step.
**Motion:** success feedback, progress transition, guided reveal.
**Avoid:** time pressure without pedagogical need, colour-only grades, motion that distracts from learning.

## 20. Finance / banking / fintech
**Baseline:** high-trust utility-first, precise typography, restrained palette, clear units and transaction states.
**Must show:** fees, rates, risks, confirmation, authentication state, transaction history, accessible charts.
**Motion:** discreet confirmation and progress; avoid celebratory animation for risky financial decisions.
**Avoid:** ambiguous currency/date formats, misleading charts, dark patterns, fake urgency.

## 21. Legal / accounting / consulting
**Baseline:** restrained corporate or editorial; hierarchy and credibility over visual novelty.
**Must show:** services, expertise, scope, credentials, contact, process, disclaimers as appropriate.
**Motion:** minimal, purposeful.
**Avoid:** playful skeuomorphism or low-contrast experimental surfaces without brand reason.

## 22. Architecture / interior design / creative portfolio
**Baseline:** editorial, Swiss grid, quiet luxury, image-first or controlled immersive 3D.
**Must show:** project imagery, role, constraints, process, outcomes, credits.
**Motion:** image reveals, carefully timed transitions, optional immersive viewer.
**Avoid:** making visitors wait through elaborate intro sequences before seeing work.

## 23. Developer tools / cybersecurity / infrastructure
**Baseline:** technical dark or neutral utility design; dense but clear; monospace only for code/data contexts.
**Must show:** system state, severity, timestamps, logs, filters, copy/export, empty/error states.
**Motion:** live updates without disorienting users; preserve scroll and selection.
**Avoid:** neon overload, unreadable grey text, flashing alert animations.

## 24. Gaming / entertainment / music
**Baseline:** expressive, immersive, high-contrast; style depends strongly on genre and audience.
**Motion:** strong but controlled; respect reduced motion and avoid motion-induced barriers.
**Must show:** core action, playback/game states, controls, captions/subtitles where relevant, safety/moderation for social features.
**Avoid:** hiding controls in hover-only layers or autoplaying loud audio.

## 25. Nonprofit / public service / government
**Baseline:** high-clarity, inclusive, content-first, accessible.
**Must show:** eligibility, steps, required documents, costs, deadlines, contact/support, privacy.
**Motion:** minimal.
**Avoid:** jargon, ambiguous requirements, visual tricks, forms that lose data.

## 26. Real estate / property
**Baseline:** image-first editorial with robust filters and structured facts.
**Must show:** price, location, availability, dimensions/units, property details, fees, contact and map/list alternatives.
**Motion:** gallery transitions, map updates.
**Avoid:** deceptive image crops, hidden fees, map-only navigation.

## 27. Social network / messaging
**Baseline:** familiar, fast, readable, state-rich; use platform conventions where helpful.
**Must show:** audience/privacy before posting, delivery/read/call states when relevant, block/report/mute, media permissions, retry.
**Motion:** short transitions and subtle presence feedback.
**Avoid:** confusing privacy defaults, inaccessible emoji-only controls, motion that hides status.

## 28. Booking / scheduling / marketplace
**Baseline:** task-first forms and lists, clear availability, transparent fees.
**Must show:** timezone, dates, price, cancellation/refund policy, selected state, confirmation.
**Motion:** step transitions and clear loading feedback.
**Avoid:** losing input, stale availability, ambiguous pending vs confirmed.

## 29. E-commerce / general retail
**Baseline:** product clarity and conversion with trust, not manipulative urgency.
**Must show:** product variants, total cost, delivery, returns, stock, cart edits, payment status.
**Motion:** image gallery, cart feedback, lightweight transitions.
**Avoid:** fake scarcity, hidden fees, confusing opt-outs.

## 30. Personal brand / creator / agency
**Baseline:** editorial or expressive brand-specific layout; distinctive typography and real work.
**Must show:** what you do, for whom, proof, case studies, contact path.
**Motion:** restrained signature interaction; fast path to work/contact.
**Avoid:** intro gates, excessive 3D, long loading sequences, generic portfolio templates.

## 31. Esports / tournament / team organisation
**Baseline:** expressive dark or high-contrast sport/tech identity with a clear utility layer for schedules and results.
**Layout:** hero (next match or tournament CTA) -> live/upcoming schedule -> brackets/standings -> teams/players -> news/media -> sponsors -> registration/contact.
**Must show:** timezone-aware match times (with local-time conversion), live/upcoming/finished states, bracket and standings in an accessible table or list alternative, registration eligibility and fees, rules, prize terms stated accurately, team and player pages, stream links with consent for third-party embeds.
**Motion:** short score/state updates, subtle live indicators; no flashing or strobing effects; static fallback for particle/glow backgrounds.
**Avoid:** unreadable neon text, hover-only controls, heavy video backgrounds on mobile, unverified sponsor/prize claims, unmoderated community features.

## 32. News / publishing / digital reading (articles, ebooks, comics, webtoons)
**Baseline:** reading-first editorial; the reader and content discovery matter more than chrome.
**Must show:** clear series/episode navigation, reading progress, bookmarks/continue-reading, reader controls (text size, theme, spacing; for comics: vertical-scroll vs paged mode and, for manga, correct reading direction), creator/author credit, pricing/unlock rules, content warnings and age gating where appropriate.
**Technical:** lazy-load long image strips with reserved dimensions, serve responsive/compressed images, preload the next episode carefully, support offline or resume where feasible, avoid layout shift between panels.
**Creator side (if a platform):** upload/publish flow with draft, preview, schedule, analytics, payout/terms clarity, copyright/DMCA reporting path.
**Avoid:** intrusive ads inside the reading flow, unclear paywalls, misleading "free" labels, claiming image-theft protection that cannot be delivered.

## 33. Health, fitness, and wellness consumer apps
**Baseline:** warm minimal or friendly structured; encouraging, never shaming.
**Must show:** clear units, privacy controls for sensitive data, honest limits of tracking accuracy, easy pause/delete of data.
**Avoid:** medical or diagnostic claims without basis, guilt-based streak mechanics, body-shaming copy, colour-only progress states, dark patterns around subscriptions.

## 34. Children / family products
**Baseline:** large targets, simple flows, friendly but not chaotic visuals; parent/guardian controls separated from child UI.
**Must show:** parental gate for purchases/external links, clear privacy handling, age-appropriate language.
**Avoid:** manipulative rewards, ads in child flows, tracking without lawful basis, tiny targets, timers that punish.
**Note:** verify child-privacy laws for the target regions (e.g. COPPA in the US, GDPR-K in the EU, India's DPDP provisions on children's data).

## 35. Events / ticketing
**Baseline:** task-first with strong date/venue/price clarity.
**Must show:** timezone, venue and access information, total price including fees before payment, seat/ticket selection state, accessible seating info, refund/transfer rules, mobile ticket that works offline.
**Avoid:** fake countdowns and fake "X people viewing", hidden fees revealed at the last step, inaccessible seat maps with no list alternative.

## 36. Mobility / delivery / logistics tracking
**Baseline:** map plus list, status-first, calm real-time updates.
**Must show:** current status, ETA with uncertainty communicated honestly, contact/support, safety and cancellation information, text alternatives to map-only status, graceful offline/poor-signal behaviour.

## 37. Jobs / recruiting
**Baseline:** search-first, structured listings, clear application progress.
**Must show:** role, location/remote status, pay range where lawful or known, application stage, ability to save and resume an application, accessibility accommodations path.
**Avoid:** forcing account creation before viewing jobs, redundant data entry, dark patterns that hide employer or fee information.

## 38. Crypto / trading / high-risk finance
**Baseline:** high-trust utility with precise numbers and explicit risk communication.
**Must show:** fees, risks, irreversibility of actions, confirmation with full details, numeric precision and units, clearly labelled estimates.
**Avoid:** gamification of risky actions, celebratory animation on trades, fake urgency, misleading yield or performance displays, hiding loss states.

## 39. Smart-home / IoT / hardware companion apps
**Baseline:** state-first control surfaces, large clear controls, resilient to offline devices.
**Must show:** device state versus pending command, offline/last-seen status, confirmation for safety-relevant actions, firmware/update status, local-control fallback where possible.

---

# PART D — ANIMATION & MOTION CATALOGUE

## 40. Motion principles
Motion should explain state, hierarchy, cause/effect, spatial relationships, progress, or brand personality. Every animation needs a purpose and a fallback. Prefer animating `transform` and `opacity` when appropriate; avoid animating expensive layout/paint properties unnecessarily. Test real devices and reduced-motion settings.

### Motion levels
- **Level 0 — None:** static interface; appropriate for high-stakes, dense, or performance-constrained contexts.
- **Level 1 — Micro:** focus, press, toggle, validation, small feedback.
- **Level 2 — Functional:** drawers, dialogs, tabs, page transitions, progress.
- **Level 3 — Expressive:** hero reveal, kinetic typography, product storytelling.
- **Level 4 — Immersive:** 3D, WebGL, scroll narratives, spatial transitions. Use only with a strong reason and a non-immersive path.

Set a project-wide motion budget. Most product UI should live at Levels 0–2; use Levels 3–4 selectively.

## 41. Entrance and reveal animations
- Fade in: opacity only; quiet, broad use.
- Fade + rise: opacity + small vertical movement; section reveal.
- Slide in from edge: panel/drawer/contextual content.
- Scale in: popover, menu, dialog; avoid exaggerated bounce for serious products.
- Clip/mask reveal: image or editorial headline.
- Staggered reveal: related list/grid items; keep delay short and avoid long waits.
- Blur-to-sharp: premium/ambient reveal; keep subtle and avoid accessibility/performance issues.
- Wipe/reveal: transitions that imply direction or uncover content.
- Line-draw/SVG path: diagrams, logos, maps, illustrations; do not delay essential content.
- Character/word/line text reveal: campaign/hero only; avoid for long content, accessibility, or SEO-critical content if text becomes unavailable.
- Shared-element transition: preserve perceived identity as an item moves between views.
- Hero image crop transition: product/gallery storytelling.
- Skeleton-to-content transition: avoid large layout shifts and misleading placeholders.

## 42. Exit and dismissal animations
- Fade out.
- Slide away.
- Collapse/height transition.
- Shrink/disappear.
- Drawer/dialog close.
- Toast dismissal.
- List item removal with layout reflow.
- Shared-element return transition.

Rule: do not delay the next task merely to finish an exit animation. Ensure focus moves correctly when overlays close.

## 43. Hover, focus, press, and control feedback
- Colour/border transition.
- Underline draw.
- Icon nudge.
- Subtle lift/elevation.
- Shadow/outline change.
- Press-in scale or translation.
- Toggle thumb movement.
- Checkbox/radio selection tick.
- Switch track/thumb transition.
- Button loading spinner.
- Button success state.
- Input focus ring transition.
- Validation border + inline message.
- Tooltip/popover reveal.
- Card image zoom (desktop hover only as enhancement).
- Cursor-follow effect (decorative, never required to understand/use the interface).
- Magnetic button (experimental; avoid for accessibility-critical actions).
- 3D tilt (decorative; disable for reduced motion and touch; avoid on dense UI).

Always provide equivalent focus-visible feedback. Hover is never the only affordance.

## 44. Navigation and layout transitions
- Crossfade page transition.
- Directional slide between sibling pages.
- Shared-axis transition for related views.
- Shared-element transition for selected object.
- Tab indicator slide.
- Accordion expand/collapse.
- Sidebar collapse/expand.
- Drawer slide.
- Modal scale/fade.
- Bottom sheet rise.
- View transition for route/state change (the View Transitions API: check browser support for same-document vs cross-document use and provide a no-animation fallback).
- Reorder animation for drag-and-drop.
- List/grid layout transition.
- Filter result crossfade.
- Breadcrumb/state change.
- Sticky header compacting (only when it preserves orientation and content access).

Do not animate every route by default. Respect browser history and avoid making back/forward feel incorrect.

## 45. Scroll and storytelling effects
- Scroll-triggered reveal.
- Parallax layers.
- Sticky section narrative.
- Scroll progress indicator.
- Horizontal gallery controlled by scroll.
- Pinned panel / scroll-linked scene.
- Image mask on scroll.
- Text highlight on scroll.
- Number/count-up animation.
- Timeline reveal.
- Depth/scale storytelling.
- Scroll-linked colour transition.

Rules: avoid scroll hijacking, forced horizontal scrolling, long pinned sections, motion sickness, and effects that fail on touch/keyboard. Use CSS scroll-driven animation where supported and appropriate, but provide graceful fallback. Respect `prefers-reduced-motion`.

## 46. Background and ambient motion
- Slow gradient drift.
- Mesh gradient animation.
- Aurora flow.
- Subtle noise/grain movement.
- Floating decorative shapes.
- Particle field.
- Starfield.
- Animated grid.
- Soft glow pulse.
- Blob morph.
- Liquid/wave surface.
- Light sweep/shimmer.
- Background video loop.
- 3D object rotation.
- Canvas/WebGL scene.

Use sparingly. Ambient motion competes with reading, consumes CPU/GPU/battery, and can harm performance. Never make content contrast depend on the background remaining at one frame. Provide static fallbacks.

## 47. Data, media, and system-state motion
- Progress bar / determinate progress.
- Indeterminate spinner.
- Skeleton shimmer (avoid excessive shimmer).
- Live data update highlight.
- Chart draw-in (never hide values or distort interpretation).
- Counter transition (do not imply precision where values are estimates).
- Audio waveform.
- Video scrub preview.
- Upload progress and completion.
- Download status.
- Toast/status announcement.
- Retry state.
- Sync indicator.
- Connection lost/restored indicator.
- Recording/camera/microphone active indicator.
- Incoming call/ringing state.
- Typing indicator.
- Message sent/delivered/read transition.
- Optimistic update with rollback.
- Undo affordance after destructive action.

Motion must not be the sole carrier of system state; provide text and accessible announcements where needed.

## 48. 3D and physics-based motion
- Spring motion.
- Inertial drag.
- Snap-to-position.
- Object orbit/rotation.
- Product configurator rotation.
- Depth/parallax.
- Card tilt.
- Morphing 3D shape.
- Camera pan/zoom.
- Spatial panel transition.
- Physics-based particles.
- Gesture-driven transformation.

Use when spatial manipulation is a genuine task or adds significant value. Check input alternatives, keyboard access, GPU use, loading, touch, reduced motion, and low-power devices.

## 49. Animation timing and easing
Starting ranges—not rigid laws:
- Micro feedback: roughly 80–160 ms.
- Small control transition: roughly 120–220 ms.
- Popover/menu: roughly 120–240 ms.
- Dialog/drawer: roughly 180–320 ms.
- Page transition: roughly 180–350 ms.
- Expressive hero motion: may be longer, but must not block interaction or hide content.
- Stagger: short and limited; avoid cascading delays that make users wait.

Use ease-out for elements entering/resting, ease-in for exits, ease-in-out for balanced state changes, and spring motion when a physical/interactive feel improves understanding. Avoid defaulting every animation to the same spring or bounce. Test perceived speed and device performance.

## 50. Motion library/tool selection
Select tools based on the stack and interaction complexity; do not install multiple libraries without need.

- **CSS transitions/keyframes:** simple hover, focus, opacity, transform, loops; lowest overhead.
- **Web Animations API:** imperative browser animations without a large framework dependency.
- **Motion (formerly Framer Motion):** React-oriented transitions, gestures, layout animation, presence, and orchestration.
- **GSAP:** advanced timelines, complex sequencing, scroll-linked storytelling, and precise control; use responsibly.
- **Lottie:** vector animation exported from motion tools; useful for designed illustrations and small feedback moments, but monitor file size and control/accessibility.
- **Rive:** interactive state-machine animations and responsive vector experiences.
- **Three.js / WebGL:** 3D scenes and interactive spatial visuals; higher complexity and performance cost.
- **Canvas / SVG:** custom diagrams, lightweight vector animation, data visuals, and drawing.
- **Native platform APIs:** prefer platform conventions for native apps.
- **Framer/Webflow/visual builders:** choose native capabilities when they satisfy the design; do not add code just to imitate a library.

Before choosing, inspect project dependencies and existing conventions. Prefer the smallest reliable tool that supports the required behaviour.

## 51. Reduced motion and motion accessibility
- Honour `prefers-reduced-motion`.
- Remove or substantially reduce parallax, large scale motion, spinning, and continuous decorative movement.
- Preserve essential state feedback with opacity, border, text, or immediate state change.
- Avoid flashing content and rapid repeated movement.
- Allow pause/stop for applicable auto-moving content.
- Ensure animations do not block reading, keyboard operation, or task completion.
- Test keyboard focus during dialogs, drawers, route transitions, and list changes.

---

# PART E — TOKENS, COMPONENTS, AND IMPLEMENTATION

## 52. Design tokens
Define semantic tokens instead of scattered values:
- `color.text.primary`, `color.text.secondary`, `color.surface.default`, `color.surface.raised`
- `color.border.default`, `color.action.primary`, `color.focus.ring`
- `color.status.success`, `color.status.warning`, `color.status.error`, `color.status.info`
- `type.display`, `type.heading.xl`, `type.body.md`, `type.label.sm`
- `space.1`, `space.2`, `space.3`, `space.4`, `space.6`, `space.8`
- `radius.control`, `radius.card`, `radius.dialog`, `radius.pill`
- `shadow.card`, `shadow.popover`, `shadow.dialog`
- `motion.duration.fast`, `motion.duration.normal`, `motion.ease.standard`
- `layer.dropdown`, `layer.sticky`, `layer.overlay`, `layer.toast`
- `container.content`, `container.wide`, `breakpoint.*`

Example values must be adapted to the brand, content, platform, and contrast requirements. Tokens should be semantically named and documented.

## 53. Component catalogue to plan
Buttons; icon buttons; links; text fields; password fields; search fields; textareas; select; combobox; checkbox; radio group; switch; slider; date/time picker; file upload; form field wrapper; validation summary; tooltip; popover; dropdown menu; context menu; tabs; accordion; breadcrumb; pagination; stepper; navbar; sidebar; bottom navigation; card; list item; avatar; badge; chip/tag; alert; toast; banner; modal/dialog; drawer; bottom sheet; table; data grid; chart; calendar; timeline; progress bar; skeleton; spinner; empty state; error state; command palette; media player; image gallery; carousel; map/list view; chat message; message composer; call controls; notification item; pricing card; testimonial; FAQ; footer; cookie/privacy controls.

For every interactive component specify:
- purpose and when to use/not use;
- anatomy and variants;
- states: default, hover, focus, pressed, selected, disabled, loading, success, error;
- keyboard and touch behaviour;
- accessible name/role/state;
- responsive behaviour;
- content limits and overflow;
- loading, empty, error and success handling;
- analytics events only where useful and privacy-appropriate.

## 54. Responsive design rules
- Design around content and task breakpoints, not only named devices.
- Test narrow, intermediate, standard desktop, and wide layouts.
- Define what changes: order, columns, navigation, density, controls, image crop, and visibility.
- Avoid hiding essential information simply because the screen is small.
- Support keyboard, pointer, touch, zoom, large text, and orientation changes where relevant.
- Use fluid type/layout where appropriate, with sensible min/max constraints.
- Prevent fixed elements from covering content or focus.
- Provide list/table alternatives when dense data cannot fit.
- Treat mobile as a real task context, not a scaled-down desktop.

## 55. Accessibility guardrails
Use current W3C WCAG guidance as the reference, and verify the exact criterion and exceptions before claiming conformance. For WCAG 2.2 AA, normal text generally requires at least 4.5:1 contrast, large text generally 3:1, and meaningful UI components/graphics often require 3:1 in applicable cases. This is not the complete standard.
- Semantic HTML and meaningful heading structure.
- Keyboard access and visible, unobscured focus.
- Accessible names, roles, values, labels, instructions, and errors.
- Contrast and non-colour status cues.
- Reflow/zoom and text resizing.
- Target size and spacing checks, accounting for criterion exceptions.
- Text alternatives, captions, transcripts, and accessible media controls.
- Reduced motion and no harmful flashing.
- Accessible authentication and recovery.
- Automated testing plus manual keyboard/screen-reader testing and, where feasible, testing with disabled users.

**WCAG 2.2 items AI agents often miss** (verify exact wording and level before claiming conformance):
- 2.4.11 Focus Not Obscured (AA): sticky headers, cookie banners, and chat widgets must not fully hide the focused element.
- 2.5.7 Dragging Movements (AA): any drag action needs a single-pointer alternative (buttons, tap-to-move).
- 2.5.8 Target Size Minimum (AA): at least 24x24 CSS px or sufficient spacing. Better practice: 44x44 CSS px (WCAG 2.5.5 is AAA; Apple HIG uses 44x44 pt; Material uses 48x48 dp).
- 3.2.6 Consistent Help (A): help/contact in the same relative place across pages.
- 3.3.7 Redundant Entry (A): do not make users retype information already given in the same process.
- 3.3.8 Accessible Authentication - Minimum (AA): no cognitive-function tests (memorising, transcribing) without an alternative; allow paste and password managers.
- 1.4.10 Reflow: content usable at 320 CSS px width without two-dimensional scrolling (except data tables, maps, and similar).
- 1.4.4 / 1.4.12: text resizable to 200% and tolerant of increased line, paragraph, letter, and word spacing without loss of content.
- 1.4.13: hover/focus popovers must be dismissible, hoverable, and persistent.
- 2.2.2 Pause, Stop, Hide: auto-moving content longer than 5 seconds needs a control.
- 4.1.3 Status Messages: announce toasts, form results, and live updates (e.g. role="status" / aria-live) without moving focus.
- Support forced-colors / high-contrast modes (do not rely on background images or box-shadow alone for essential borders or focus).
- WCAG 3.0 is still a draft; WCAG 2.2 remains the reference unless a project or law specifies otherwise.

## 56. Performance guardrails
- Avoid unnecessary large background video, heavy blur, continuous canvas/WebGL, and multiple animation libraries.
- Use responsive/compressed images and appropriate formats.
- Lazy-load non-critical media without delaying important content.
- Reserve media dimensions to reduce layout shifts.
- Animate transform/opacity where appropriate.
- Avoid layout thrashing and excessive DOM effects.
- Provide static/fallback experiences for low-power devices.
- Monitor real-device rendering, CPU/GPU, battery, network and bundle impact.
- Do not use skeletons or animation to conceal actual delays.

---

# PART F — VISUAL DESIGN FOUNDATIONS

## 57. Visual hierarchy and perception principles
- **One primary focal point per view,** then a clear second and third level. Establish hierarchy with size, weight, contrast, colour, spacing, position, and grouping. Do not make everything bold or accented.
- **Proximity:** related items sit closer together than unrelated ones; spacing communicates grouping more cheaply than borders or cards.
- **Similarity:** things that look alike are read as functioning alike; keep one visual treatment per function.
- **Common region / enclosure:** use containers sparingly; avoid cards inside cards.
- **Alignment:** align to a grid and to shared edges; break alignment only deliberately.
- **Contrast of scale:** a clear type and size scale makes scanning faster than decoration.
- **Reading patterns (F-pattern, Z-pattern) are tendencies,** not laws; verify with content and, when possible, testing.
- **Whitespace is a tool for grouping and pacing,** not just emptiness. More space is not automatically more premium.
- **Squint test:** blur the layout mentally; the primary action and the main heading should still stand out.

## 58. Colour system
**Build a palette in roles, not swatches:**
- Neutral ramp (roughly 9-12 steps from background to text) for surfaces, borders, and text.
- One brand/primary colour with a ramp; optionally one accent. More hues need a reason.
- Semantic colours: success, warning, error, info, each with a tint (background) and a strong (text/icon) variant.
- Interactive colours: default, hover, pressed, focus ring, disabled, visited (links where relevant).
- Data-visualization palette kept separate from the brand palette.

**Rules:**
- Check text, icon, and control contrast in every state and in both themes (see Section 55 for contrast thresholds).
- Never use colour as the only signal (add icon, text, pattern, or position).
- Use colour sparingly to point at what matters: a common starting heuristic is mostly neutrals, a smaller amount of secondary colour, and a small amount of accent (a rough guide, not a law).
- Avoid pure black on pure white for long reading in dark UIs; slightly softened pairs reduce glare, but always re-check contrast.
- Keep saturation and lightness consistent across hues so the palette feels like one family; prefer perceptually uniform spaces (e.g. OKLCH) for generating ramps.
- Roughly 1 in 12 men and 1 in 200 women have some colour-vision deficiency: test red/green and blue/purple pairs, and avoid red-versus-green as the only distinction.
- Colour meaning is cultural and domain-specific (red can mean danger, luck, or celebration; red/green gain-loss conventions differ between some markets). Confirm for the target audience.
- Brand colours that fail contrast should be used for large decorative areas, with a darker or lighter derived shade used for text and controls.
- APCA is a proposed contrast method, not part of WCAG 2.2; use WCAG ratios for conformance claims, and treat APCA as an additional input only.

## 59. Typography
- **Body size:** at least 16 px (1 rem) on web for sustained reading; avoid text smaller than about 12 px anywhere, and never rely on tiny uppercase labels for critical information.
- **Line length:** roughly 45-75 characters per line for body text (about 66 is a classic target); constrain with `max-width` in `ch`.
- **Line height:** roughly 1.4-1.6 for body; 1.1-1.3 for large headings; scripts with tall marks need more (see below).
- **Scale:** use a modular or fluid scale (ratio roughly 1.125-1.333) with a small number of steps; avoid arbitrary sizes.
- **Families:** one family often suffices; two (e.g. serif/sans, display/text) is plenty. Check that weights you load are actually used.
- **Weights and style:** avoid ultra-thin weights for body and small text; use italics sparingly; avoid all-caps for long strings and increase letter-spacing slightly if used.
- **Alignment:** left-align body text (right-align for RTL); avoid justified text on the web unless hyphenation and rivers are controlled; do not centre long paragraphs.
- **Numbers:** use tabular figures in tables, prices, and dashboards; right-align numeric columns with consistent decimals.
- **Loading:** subset fonts, prefer WOFF2, use `font-display: swap` or `optional`, preload only critical fonts, define metric-matched fallbacks to limit layout shift; prefer variable fonts when several weights are needed.
- **Responsive type:** use `clamp()` with sensible min/max; support browser zoom and user font-size settings (use rem, not fixed px for text).
- **Indic scripts (e.g. Devanagari, Bengali, Tamil, Odia):** use fonts designed for the script (for example the Noto Sans/Serif family for the script, or maintained families such as Hind or Mukta for Devanagari); increase line-height (often 1.6-1.8) to prevent clipping of matras and conjuncts; avoid letter-spacing on connected scripts; check that font size feels equivalent next to Latin (Indic glyphs often look smaller at the same size); do not apply uppercase transforms, faux italics, or faux bold; test conjunct rendering and line breaking.
- **Mixed-language text (e.g. Hindi + English / Hinglish):** pair a Latin face with a script face of matching weight and visual size; set `lang` attributes per language segment for correct shaping, hyphenation, and screen-reader pronunciation.
- **RTL scripts (Arabic, Hebrew, Urdu):** use `dir="rtl"` and CSS logical properties; Arabic must not have letter-spacing; Urdu typically needs larger sizes and taller line-height than Latin.
- **CJK:** avoid italics, allow more line height, check line-breaking rules and font fallback.

## 60. Spacing, grid, and sizing
- Use a base unit (4 px with an 8 px rhythm is a common choice) and a limited spacing scale; avoid arbitrary values.
- Increase spacing between groups more than within groups (proximity).
- Use a column grid appropriate to the layout (for example 4 columns on mobile, 8 on tablet, 12 on desktop) with consistent gutters and margins; set a `max-width` for content (readable text and wide containers).
- Starting breakpoints should follow content (a common set of starting points: about 360-480, 768, 1024, 1280, 1536+ CSS px); change layout when content breaks, not at device names.
- Prefer container queries for components that appear in varying contexts.
- **Touch targets:** aim for at least 44x44 CSS px (Apple 44 pt, Material 48 dp); separate adjacent targets with enough space to avoid mis-taps; WCAG 2.2 AA minimum is 24x24 CSS px (with exceptions).
- **Radii, borders, and shadows:** define a small set (control, card, dialog, pill); do not mix many radius values on the same screen.
- **Density modes:** offer compact/comfortable only when users genuinely benefit (data-heavy tools).
- Prevent horizontal scroll; tables need an overflow or card/list strategy on small screens.

## 61. Iconography, imagery, and illustration
**Icons:**
- Use one icon set with consistent stroke, size grid (commonly 16/20/24 px), and corner style.
- Icons support text; unlabelled icons are only acceptable for universally understood actions (close, search, menu) and still need accessible names.
- Decorative icons get `aria-hidden`; meaningful icons need text or accessible names.
- Prefer inline SVG or an SVG sprite for crispness and styling; avoid icon fonts.

**Photography and imagery:**
- Use real, relevant, high-quality imagery; avoid obvious stock clichés and AI imagery that misrepresents products, staff, places, or results.
- Disclose or avoid AI-generated imagery where it could mislead (people, testimonials, medical or product results).
- Provide meaningful `alt` text for informative images and empty `alt=""` for decorative ones.
- Control aspect ratios and focal points; reserve dimensions; use `srcset`/`sizes` and modern formats (AVIF/WebP with fallbacks).
- Check text over images with an overlay or a solid area so contrast holds at every crop.
- Obtain licences/consents for photos of people and keep a record of sources.

**Illustration:**
- Choose a consistent style (line, flat, isometric, hand-drawn) and palette tied to brand tokens.
- Use illustration to explain or humanise, not to fill gaps; avoid stereotypes and inappropriate cultural shorthand.
- Keep vector assets small; provide text equivalents for informational graphics.

## 62. Data visualization and charts
- Start from the question the chart answers; choose the form accordingly (comparison -> bars; trend -> line; part-to-whole -> stacked bar or a few-slice donut; distribution -> histogram/box; relationship -> scatter; geography -> map only when location matters).
- Bars start at zero; if an axis is truncated on a line chart, say so visibly. Avoid dual axes unless clearly labelled.
- Avoid 3D charts, decorative gradients on data marks, and pie/donut charts with many slices.
- Label directly where possible; include units, time ranges, data source, and "last updated".
- Sort categories meaningfully; limit series (roughly 5-6) before switching to small multiples or filtering.
- Use colour-blind-safe palettes and add non-colour encodings (labels, patterns, shapes, line styles).
- Provide a table or text summary alternative, keyboard-accessible tooltips, and accessible names for charts.
- Handle empty, loading, error, partial, and very large/very small values explicitly.
- Never fabricate placeholder data in a production-bound design; label sample data clearly as sample.
- Responsive charts need simplified labels, scroll or summary strategies, and legible text sizes, not just a smaller render.

# PART G — UX FOUNDATIONS AND METHODS

## 63. Usability heuristics and UX principles
**Nielsen's 10 usability heuristics (use as an evaluation checklist):** visibility of system status; match between system and the real world; user control and freedom; consistency and standards; error prevention; recognition rather than recall; flexibility and efficiency of use; aesthetic and minimalist design; help users recognise, diagnose, and recover from errors; help and documentation.

**Frequently cited principles (hypotheses, not laws; evidence strength varies):**
- Jakob's Law: users expect your product to work like others they know; reserve novelty for where it adds value.
- Hick's Law: more choices tend to increase decision time; chunk, prioritise, and progressively disclose.
- Fitts's Law: bigger, closer targets are quicker to hit; place primary actions where they are easy to reach.
- Miller's observation concerns working-memory chunking; do not use it as a rigid "7 items" rule.
- Doherty threshold: respond to input quickly (a commonly cited target is feedback within a few hundred milliseconds) and show progress for longer waits.
- Aesthetic-usability effect: attractive interfaces are perceived as easier to use; this can mask real problems, so still test.
- Von Restorff (isolation) effect: the distinct item is remembered; do not highlight everything.
- Peak-end rule: people judge experiences by peaks and endings; design confirmation and recovery moments carefully.
- Goal-gradient and Zeigarnik effects: progress indicators and unfinished tasks motivate completion; use them honestly.
- Postel's Law (liberal in what you accept): accept varied input formats; be strict in what you output.
- Tesler's Law: complexity cannot be eliminated, only moved; decide who carries it.

## 64. UX research and validation methods
An AI agent cannot conduct real user research. It may plan research, draft instruments, and analyse data the user supplies. It must **never invent** interview quotes, usage statistics, survey results, or testimonials. Label unvalidated assumptions as hypotheses.

| Question | Method | Notes |
|---|---|---|
| Who are users and what do they need? | Interviews, contextual inquiry, diary studies | Qualitative; small samples, not statistics |
| How many people feel X? | Surveys, analytics | Watch sampling bias and leading questions |
| Does the IA/labelling match mental models? | Card sorting, tree testing | Test navigation structure before visual design |
| Can people complete tasks? | Moderated/unmoderated usability tests | Often small rounds (around 5 participants) repeated iteratively find many major issues; not a statistical measure |
| Where do people look/click first? | First-click and five-second tests | Good for hierarchy and clarity |
| Which version performs better? | A/B or multivariate tests | Needs enough traffic, a pre-defined metric, and a fixed duration |
| What happens in the wild? | Analytics, funnels, session replay | Respect privacy and consent; mask sensitive inputs |
| Is it accessible? | Automated scan + keyboard + screen-reader + assistive-tech user testing | Automated tools catch only part of the issues |
| Is the content understandable? | Comprehension tests, readability checks | Test with real target language readers |

**Outputs the AI can produce:** research plan, screener, interview guide, task scenarios, hypotheses and success metrics, heuristic evaluation, analysis templates, personas/jobs-to-be-done marked clearly as assumption-based unless built from data.

**Metrics:** task success rate, time on task, error rate, SUS or similar standardised questionnaires, CSAT/NPS (interpret carefully), conversion and drop-off by step, support-ticket themes. Avoid vanity metrics.

## 65. Information architecture and navigation
- Organise by user mental models and tasks (validated by card sorting/tree testing when possible), not by internal org charts.
- Keep top-level navigation concise (a common starting guide is roughly 5-7 groups) and labelled with plain words; avoid vague labels ("Solutions", "Resources") without context.
- Show current location (active state, breadcrumbs, page titles) and provide a consistent way back.
- **Mobile navigation:** bottom tab bar for 3-5 primary destinations; hamburger/drawer for secondary items (discoverability is lower; consider showing key items); avoid hiding the primary action.
- **Desktop:** top nav for marketing sites; sidebar for apps with many sections; command palette as an accelerator, not the only path.
- Footer: legal, contact, sitemap, accessibility statement, language switcher.
- Provide skip links, landmarks, and consistent heading order.
- URLs: meaningful, shareable, stable; deep links restore state (filters, tabs, selected item) where sensible; respect browser history.
- Plan redirects, 404/500 pages with helpful paths, and sitemap/robots decisions for public sites.
- Multi-step flows: show progress, allow back/edit, save progress, and confirm completion.

## 66. Forms, input, and checkout
- Use visible labels above fields; placeholders are hints, not labels. Group related fields and keep a single-column flow unless fields are clearly related and short (e.g. city/postal code).
- Ask only for what is needed; mark optional fields rather than asterisking everything; explain why sensitive data is requested.
- Use correct input types and attributes (`type`, `inputmode`, `autocomplete`, `enterkeyhint`); one-time codes should use `autocomplete="one-time-code"`.
- Validate on blur or submit, not on every keystroke; show errors inline and in a summary for long forms; move focus sensibly to the first error; keep the user's input after errors.
- Error messages say what went wrong and how to fix it, near the field, with text (not colour alone).
- Allow paste and password managers; offer show/hide password; support passkeys/social login only with clear privacy handling.
- Phone, address, and name formats vary by country; avoid rigid patterns (e.g. do not force first/last name splits; allow country codes; support regional postal formats such as India's 6-digit PIN code).
- Use native controls or accessible custom ones; avoid long dropdowns where search/typeahead works better; date pickers need keyboard and manual-entry options.
- Handle file upload with type/size guidance, progress, retry, preview, and remove.
- Disable-submit-until-valid patterns frequently hide the reason; prefer enabled buttons plus clear errors.
- Prevent double submission; confirm success clearly; send confirmation messages where appropriate.
- **Checkout:** offer guest checkout, show full cost (taxes, shipping, fees) early, clear delivery/returns, order summary visible, local payment methods for the market (e.g. UPI, cards, wallets, COD in India where relevant), retry and failed-payment recovery, and never store raw card data yourself (use the payment provider's hosted fields).

## 67. UX writing and microcopy
- Write for the target reader's language and reading level; prefer plain, concrete words; define unavoidable jargon.
- Buttons use specific verbs ("Book appointment", "Download invoice"), not vague labels ("Submit", "Click here").
- Error messages: what happened, why (if useful), and what to do next; do not blame the user.
- Empty states explain what belongs here and offer the next action.
- Confirmations state the result and next step; destructive dialogs name the object and consequence ("Delete 3 files permanently?" with "Delete" and "Cancel", not "Yes/No").
- Keep terminology consistent (do not alternate between "Sign in", "Log in", and "Login").
- Match tone to context: friendly in onboarding, calm and precise in errors and finance/health.
- Avoid confirm-shaming, fake humour in serious moments, and all-caps shouting.
- Allow for text expansion in translation (often 30-40% for some languages) and avoid concatenated sentence fragments that break grammar in other languages.
- Use real copy, not lorem ipsum, in designs meant to be evaluated; label any placeholder content clearly.

## 68. Onboarding, empty states, permissions, notifications, and settings
- Onboarding should deliver value early; allow skip; teach in context rather than long tours; do not gate basic exploration behind account creation unless required.
- Ask for permissions (notifications, location, camera, microphone, contacts) at the moment of need, with a short explanation first; handle denial gracefully with a path to change later.
- Notifications: opt-in, granular categories, frequency controls, quiet hours, and easy unsubscribe; no notification spam or fake urgency.
- Settings: sensible defaults, reversible changes, searchable if large, privacy and accessibility settings easy to find, clear save behaviour (auto-save versus explicit save).
- Account flows: sign-up, sign-in, password reset, email verification, session expiry, account deletion/data export where required, with clear states at each step.
- Re-engagement and retention messages must be honest and easy to disable.

## 69. Search, filtering, and sorting
- Make search visible when content is large; support typo tolerance, synonyms, suggestions/autocomplete, recent searches, and keyboard navigation.
- Zero-results pages explain why and offer alternatives (broaden filters, popular items, contact).
- Filters: show active filters as removable chips, provide "clear all", display result counts, reflect state in the URL, and use a mobile bottom sheet/full-screen filter with apply/cancel.
- Sorting: state the sort order, choose a sensible default, and keep it stable across pagination.
- Pagination versus infinite scroll: use pagination or "load more" when users need to find their place, compare, or reach the footer; if using infinite scroll, preserve position on back navigation and offer a keyboard-reachable footer.
- Loading and error states for each search/filter operation; avoid layout jumps.

## 70. Dark patterns and ethical design
Do not implement: confirm-shaming, forced continuity (hard-to-cancel subscriptions), hidden or drip-priced costs, fake countdowns/scarcity/social proof, pre-ticked consent boxes, trick or double-negative wording, disguised ads, bait-and-switch, nagging, forced account creation, obstructive cancellation flows, hidden unsubscribe, or misdirection that favours the business over the user.

- Cancelling should be about as easy as signing up.
- Present consent choices (accept/reject) with equal prominence.
- Testimonials, ratings, logos, and statistics must be real and verifiable.
- Regulators in several regions actively address dark patterns (for example India's guidelines on dark patterns issued by the Central Consumer Protection Authority, the EU's consumer and digital-services rules, and US FTC enforcement). Verify current local rules.
- Ethical review question: "Would this design still be acceptable if the user saw exactly why we built it this way?"

## 71. Localization and internationalization
- Separate text from code from the start; support translation, pluralisation rules, gender/grammar variants, and right-to-left layouts where relevant.
- Use `lang` and `dir` attributes; use CSS logical properties (`margin-inline-start`, `padding-inline`) instead of left/right.
- Format dates, times, numbers, currency, and units with `Intl` APIs; show timezone explicitly for scheduled events; be careful with date order (DD/MM vs MM/DD) and numeral systems.
- Indian context details (where relevant): currency symbol and lakh/crore digit grouping (e.g. 1,00,000), IST vs UTC offsets, +91 phone codes, PIN codes, multi-language audiences (Hindi, Bengali, Odia, Tamil, Telugu, and others), mixed-script content, and low-bandwidth Android usage; provide a language switcher that is easy to find and persists.
- Design for text expansion/contraction; avoid text in images; use flexible containers.
- Icons and imagery should be culturally appropriate; avoid hand gestures, colours, or metaphors with unintended meanings.
- Provide hreflang/metadata for multilingual public sites; avoid auto-redirecting users solely by IP without an override.
- Test with real translations, long strings, and native speakers; do not rely on machine translation for legal, medical, or financial content without review.

## 72. Privacy, consent, and legal-awareness checklist
This is awareness guidance, not legal advice. Verify obligations with qualified counsel for the project's jurisdictions.
- **Privacy/data:** GDPR and ePrivacy (EU/UK), CCPA/CPRA (California), India's Digital Personal Data Protection Act and its rules (check current phased commencement), children's data rules (COPPA and others), sector rules (e.g. HIPAA for US health data).
- **Consent UX:** clear purpose, granular options, equal-weight accept/reject, easy withdrawal, no consent walls that block essential content unless lawful; load analytics/ads/embeds only after consent where required.
- **Policies:** privacy policy, terms, refund/cancellation policy, cookie information, contact details, grievance/data-protection officer details where required; link them from forms and footers.
- **Accessibility law:** ADA-related claims (US), European Accessibility Act (applies to many consumer products and services in the EU), India's RPwD Act and GIGW guidelines for government websites. Publish an accessibility statement where appropriate.
- **Advertising/claims:** health, finance, and educational outcome claims need substantiation; disclose sponsorship and affiliate relationships; label AI-generated content where required or where it could mislead.
- **Payments/security:** PCI DSS scope reduced by using hosted payment fields; HTTPS everywhere; secure session handling; avoid collecting data you do not need.
- **Intellectual property:** licences for fonts, images, icons, music, and code; credit and terms for user-generated content; copyright/takedown process for platforms.

# PART H — PLATFORM, THEMING, METRICS, AND HANDOFF

## 73. Mobile, touch, and offline patterns
- Place frequent actions within thumb reach (bottom bars, sheets) but keep destructive actions deliberate.
- Every gesture (swipe, long-press, pinch) needs a visible, discoverable alternative.
- Respect safe areas (`env(safe-area-inset-*)`) and use dynamic viewport units (`dvh`/`svh`) rather than plain `100vh` for full-height layouts.
- Keep form input text at 16 px or larger to avoid unwanted zoom on iOS Safari; do not disable pinch-zoom.
- Handle on-screen keyboard overlap, orientation changes, and sticky bars that obscure fields.
- Design for low-end devices and slow networks: small JS/CSS budgets, compressed images, skeletons only where they reflect real loading, data-saver awareness (`Save-Data`, `prefers-reduced-data` where supported).
- Offline/poor-connection states: queue actions, show sync status, allow retry, avoid data loss; consider a PWA (installable, cached shell) when it fits the product.
- Test on real devices, including smaller screens and older Android versions.

## 74. Theming, dark mode, and contrast modes
- Use `color-scheme` and `prefers-color-scheme`; provide a user toggle (system / light / dark) that persists, and avoid a flash of the wrong theme at load.
- Build themes from semantic tokens, not by inverting colours; re-check contrast, focus rings, borders, shadows, charts, illustrations, logos, and images in each theme.
- In dark UIs, convey elevation with lighter surfaces rather than only shadows, and reduce saturation of bright accent colours.
- Support forced-colors/high-contrast mode (`@media (forced-colors: active)`) and keep borders/focus indicators visible via system colours.
- Offer density, text-size, and motion preferences where useful; respect OS-level preferences by default.
- Email and print: test email clients (table-based layouts, limited CSS, dark-mode inversion), and provide a print stylesheet or PDF alternative for documents users may need to print.

## 75. Other platforms and interaction models
- **TV / 10-foot UI:** large type, D-pad focus order and visible focus, overscan-safe margins, minimal text input.
- **Wearables:** glanceable, one primary action, short sessions, haptic/audio redundancy.
- **Kiosks:** large targets, timeout with warning, privacy for entered data, accessibility mode (audio/tactile/reach height), clear reset.
- **Automotive:** minimise glance time, large targets, voice alternatives, no distracting animation while driving.
- **Voice / conversational UI:** confirm intent, handle errors and silence, provide visual or text alternatives, and clearly allow exit.
- **AR/VR/spatial:** comfort first (avoid head-locked clutter, motion sickness triggers), clear boundaries, input alternatives, session length awareness.
- **Desktop apps:** keyboard shortcuts, menus, window management, drag and drop, undo history.

## 76. Core Web Vitals, SEO, and conversion fundamentals
- **Core Web Vitals (75th percentile field data, verify current thresholds):** LCP at or under about 2.5 s, INP at or under about 200 ms, CLS at or under about 0.1. Measure with field data (CrUX/RUM) as well as lab tools.
- **Contrast thresholds (WCAG AA):** normal text 4.5:1, large text (about 24 px regular or 18.66 px bold and above) 3:1, UI components and graphical objects 3:1.
- **Performance budgets:** set explicit budgets for JavaScript, CSS, images, fonts, and third-party scripts; audit third-party tags regularly.
- **SEO basics:** one `h1`, logical heading order, descriptive titles and meta descriptions, semantic HTML, crawlable links, real text (not text in images), structured data where accurate, canonical URLs, sitemap, fast mobile pages, and hreflang for multilingual sites. Client-only rendering may need server rendering or prerendering for discoverability.
- **Conversion design:** a single clear primary action per view, evidence of value (real proof), reduced friction, transparent pricing, and clear next steps. Persuade through clarity and trust, not pressure.
- **Analytics:** define events and goals before launch; respect consent; avoid collecting personal data you do not need.

## 77. AI-assisted design and code generation pitfalls
- Generated UI often defaults to generic gradients, cards, and glass; apply the anti-patterns in Section 4 and the project brief.
- Verify library APIs, component props, and class names against the installed version's documentation; do not assume a function exists.
- Avoid "div soup": use semantic elements (`button`, `a`, `nav`, `main`, `label`, `table`) and correct ARIA only when native semantics are insufficient.
- Replace lorem ipsum, fake names, fake metrics, and fake testimonials with real content or clearly labelled placeholders.
- Check generated images and icons for correctness (text artefacts, wrong anatomy, misleading products).
- Keep generated code consistent with the existing codebase: reuse components, tokens, and conventions rather than adding parallel systems.
- Run lint, type checks, accessibility checks, and view the rendered page at multiple widths before declaring work complete.
- Report what was verified and what was not; do not claim accessibility, performance, or legal compliance that was not tested.
- For AI-powered product features: show sources/provenance where relevant, allow edit/regenerate/undo, disclose AI use where appropriate, never present uncertain output as certain, design for failure and refusal states, and protect user data in prompts and logs.

## 78. Design handoff, documentation, and maintenance
- Express design decisions as tokens (consider the W3C Design Tokens Community Group format) and map them to code variables; keep names semantic.
- Document each component: purpose, anatomy, variants, states, accessibility notes, do/don't examples, and code usage.
- Use a component workshop (e.g. Storybook or equivalent) and automated checks: unit tests, visual regression, accessibility (e.g. axe), and keyboard end-to-end tests.
- Version the design system, keep a changelog, define a deprecation process, and name owners.
- Track design debt (inconsistencies, one-off components) and schedule clean-up.
- Keep a living decision log (why a style, pattern, or library was chosen) so later changes respect earlier reasoning.
- Record content ownership: who updates copy, imagery, prices, schedules, and legal text, and how often.

## 79. Starter implementation snippets (adapt values; they are placeholders)
```css
:root {
  color-scheme: light dark;
  /* Replace with brand-derived values and verify contrast in every theme */
  --color-text-primary: #1a1a1a;
  --color-text-secondary: #4a4a4a;
  --color-surface-default: #ffffff;
  --color-border-default: #d0d0d0;
  --color-action-primary: #0b5fff;
  --color-focus-ring: #0b5fff;
  --space-1: 0.25rem; --space-2: 0.5rem; --space-3: 0.75rem; --space-4: 1rem;
  --space-6: 1.5rem;  --space-8: 2rem;
  --radius-control: 0.5rem; --radius-card: 0.75rem;
  --motion-fast: 120ms; --motion-normal: 200ms;
  --ease-standard: cubic-bezier(0.2, 0, 0, 1);
}

:focus-visible {
  outline: 3px solid var(--color-focus-ring);
  outline-offset: 2px;
}

/* Keep sticky UI from covering focused elements */
html { scroll-padding-top: 5rem; }

.prose { max-width: 70ch; line-height: 1.6; }

@media (prefers-reduced-motion: reduce) {
  /* Blunt fallback; prefer component-level alternatives that keep essential feedback */
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
    scroll-behavior: auto !important;
  }
}

@media (forced-colors: active) {
  :focus-visible { outline: 3px solid CanvasText; }
}
```

# PART I — TASK-SPECIFIC AI PROMPTS

## 80. Master design-agent prompt
You are the design intelligence layer for this product. Analyse the project brief and repository before choosing an aesthetic. Determine audience, task, industry, risk, content density, brand, platform, performance constraints, and accessibility needs. Select one primary style, at most two supporting influences, one layout strategy, a semantic colour system, type scale, spacing/grid, component patterns, image strategy, and motion level. Explain why the direction fits and what you deliberately rejected. Do not default to glassmorphism, purple gradients, rounded cards, or excessive motion. Preserve existing brand assets and project conventions unless asked to redesign them. Build all important states and responsive layouts. Use truthful content. Verify the rendered result, keyboard access, contrast, reduced motion, responsiveness, and loading/error states. Deliver a concise design decision record and a QA report.

## 81. Industry-aware design selection prompt
Given the following product, create three distinct design directions:
A. safest and clearest;
B. brand-distinctive;
C. experimental but still usable.
For each, specify style, layout, palette roles, typography, imagery, component shapes, motion level, accessibility risks, performance risks, and audience fit. Score each against usability 25%, industry fit 20%, distinctiveness 15%, accessibility 15%, content fit 10%, performance 10%, maintainability 5%. Reject directions that fail hard requirements. Recommend one direction and explain why. Do not generate code until the choice is reasoned through or the user explicitly asks to skip exploration.

## 82. Animation selection prompt
For each animation, state:
- user/system purpose;
- trigger and end state;
- target elements and properties;
- duration/easing starting point;
- whether it blocks interaction;
- keyboard/touch equivalent;
- reduced-motion fallback;
- performance risk;
- whether the animation is necessary.
Prefer functional motion over decoration. Do not animate every element. Use the project's existing library where possible and avoid adding dependencies without need.

## 83. Design audit prompt
Audit the live/rendered UI for:
- visual hierarchy and task clarity;
- generic/template-like AI aesthetics;
- spacing, typography, colour, density and consistency;
- responsive layout at several widths;
- all component states;
- content accuracy and overflow;
- keyboard/focus and accessibility;
- motion purpose/reduced-motion;
- loading, empty, error, offline and success states;
- performance and unnecessary effects;
- trust, privacy and dark patterns.
Rank issues by severity and impact. For each issue, give location, observed problem, user impact, recommended fix, and a verifiable acceptance criterion. Do not redesign the whole product if a targeted correction solves the problem.

## 84. Design system generation prompt
Inspect the current product and establish:
1. foundations/tokens;
2. typography and semantic colour roles;
3. spacing/grid/radii/elevation/motion;
4. component inventory and variants;
5. state definitions;
6. accessibility behaviour;
7. responsive rules;
8. documentation and contribution conventions.
Reuse existing conventions where sound. Avoid creating duplicate components or arbitrary values. Include examples of correct and incorrect use.

## 85. Accessibility audit prompt
Audit the rendered UI against WCAG 2.2 AA using automated checks, keyboard-only navigation, a screen-reader pass, zoom/reflow at 320 px and 200% text, forced-colors/high contrast, and reduced motion. For each issue provide: WCAG criterion, location, observed behaviour, affected users, severity, recommended fix, and a verifiable acceptance test. State clearly what was not tested. Do not claim conformance.

## 86. Content and microcopy audit prompt
Review all visible text, labels, errors, empty states, confirmations, and legal/consent wording for clarity, accuracy, tone, consistency, localisation readiness, reading level, and dark patterns. Flag any invented claims, statistics, testimonials, or placeholder text. Propose replacements with rationale, and note text-expansion risks.

## 87. Handoff and documentation prompt
Produce the design tokens, component list with states and accessibility notes, responsive rules, motion spec with reduced-motion alternatives, content/localisation notes, known limitations, test plan, and a decision log. Mark assumptions and unverified items explicitly.

---

# PART J — FINAL QUALITY GATES

## 88. Before implementation
- Is the user problem clear?
- Is the selected style appropriate for the audience and domain?
- Are style, layout, component system, and motion being treated as separate decisions?
- Is there a reason for every major decorative effect?
- Are high-risk tasks treated with appropriate clarity and trust?
- Is there a complete sitemap/flow and state list?
- Are real content, languages, and target devices/networks known or explicitly assumed?
- Have legal/privacy and accessibility obligations for the regions involved been identified?

## 89. Before shipping
- Does the primary task work on mobile and desktop?
- Can users understand where they are and what to do next?
- Are all controls identifiable and operable?
- Are loading, empty, error, offline, success, cancellation and retry states covered?
- Does keyboard focus remain visible and logical?
- Are text and component contrast requirements checked?
- Is reduced motion respected?
- Do animations add meaning and remain performant?
- Are privacy, pricing, permissions and destructive consequences clear?
- Is the rendered result consistent with the chosen design direction?
- Has the implementation been checked in a real browser/device context?
- Are assumptions and unresolved issues documented?
- Has all copy, data, imagery, and proof been checked for truthfulness (no invented claims, testimonials, statistics, or metrics)?
- Are dark patterns absent (equal-weight consent choices, honest pricing, easy cancellation)?
- Are privacy, consent, policy links, and applicable legal requirements addressed or flagged for professional review?
- Are languages, scripts, reading direction, date/number/currency formats, and text expansion handled?
- Are Core Web Vitals and performance budgets checked on real-world conditions (mid-range device, slow network)?
- Are SEO basics, metadata, and social-share previews set for public pages?
- Are the design tokens, component documentation, and decision log complete enough for handoff?

---

# PART K — RESOURCE INDEX

Use primary sources for requirements and community sources for inspiration. Community posts are anecdotal and should not override standards or user evidence.

## Standards and official design guidance
- W3C WCAG 2.2 Understanding: https://www.w3.org/WAI/WCAG22/Understanding/
- W3C WCAG overview: https://www.w3.org/WAI/standards-guidelines/wcag/
- Apple Human Interface Guidelines: https://developer.apple.com/design/human-interface-guidelines/
- Material Design: https://m3.material.io/
- Microsoft Fluent 2: https://fluent2.microsoft.design/
- IBM Carbon Design System: https://carbondesignsystem.com/
- Shopify Polaris: https://polaris.shopify.com/
- Atlassian Design System: https://atlassian.design/
- Salesforce Lightning Design System: https://www.lightningdesignsystem.com/
- GOV.UK Design System: https://design-system.service.gov.uk/
- U.S. Web Design System: https://designsystem.digital.gov/
- Nielsen Norman Group usability heuristics: https://www.nngroup.com/articles/ten-usability-heuristics/
- WAI-ARIA Authoring Practices Guide: https://www.w3.org/WAI/ARIA/apg/
- web.dev (performance, Core Web Vitals, accessibility): https://web.dev/
- Laws of UX (overview of common UX principles; treat as hypotheses): https://lawsofux.com/
- Baymard Institute (e-commerce/checkout research): https://baymard.com/
- W3C Design Tokens Community Group: https://www.w3.org/community/design-tokens/
- Google Fonts / Noto (multi-script font coverage): https://fonts.google.com/noto

## Animation and implementation references
- Motion docs: https://motion.dev/docs
- GSAP docs: https://gsap.com/docs/
- Lottie: https://airbnb.io/lottie/
- Rive: https://rive.app/
- Three.js docs: https://threejs.org/docs/
- MDN Web Animations API: https://developer.mozilla.org/en-US/docs/Web/API/Web_Animations_API
- MDN `prefers-reduced-motion`: https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-reduced-motion

## GitHub catalogues and inspiration
- Awesome Style Refs: https://github.com/jerelvelarde/awesome-style-refs
- Awesome UI: https://github.com/coderdiaz/awesome-ui
- Awesome UX: https://github.com/uxreview/awesome-ux
- Awesome Neumorphism: https://github.com/jqueryscript/awesome-neumorphism
- Search for maintained repositories and check license, last update, dependencies, accessibility, and compatibility before using code.

## Community discussion
- r/UIUX: https://www.reddit.com/r/UIUX/
- r/UX_Design: https://www.reddit.com/r/UX_Design/
- r/webdesign: https://www.reddit.com/r/webdesign/
- Treat Reddit opinions as qualitative signals, not authoritative design rules.

## Link verification note
On this edit, the four GitHub repositories listed above were re-checked and loaded successfully. Other links were not re-verified in this edit; check them before relying on them, as sites and URLs change.

## Maintenance policy
This knowledge base should be updated over time. Before adopting a new style, animation library, or platform convention:
1. verify that the reference is current;
2. inspect licensing and maintenance;
3. test accessibility and performance;
4. compare with the product's actual users and tasks;
5. document the decision and its trade-offs.

**Core principle:** choose design because it helps this product and its users—not because a style is trending or easy for an AI to generate.
