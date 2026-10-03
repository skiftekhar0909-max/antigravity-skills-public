# The Complete UI/UX Design Field Guide — Text Reference

> Text extracted from the supplied 2026 PDF. Repeated page headers and page-number labels were removed. Check linked sources in the original document if exact formatting or a citation matters.

THE COMPLETE UI/UX
DESIGN FIELD GUIDE
A practical, broad-spectrum reference for designing websites, mobile apps,
SaaS products, dashboards, e-commerce, and digital services
Edition: October 2026 • Scope: research, interaction, visual design,
accessibility, systems, prototyping, testing, handoff, and product quality
Built as a working playbook—not a claim that one document can contain every future design
detail. It gives you a structured map, usable checklists, and primary-source links for deeper
study.
Use it as a reference while planning, designing, reviewing, and shipping real
products.
How to use this guide
UI/UX is a large discipline. This guide condenses its main practice areas into a usable reference and links to
authoritative standards and curated libraries. Use the chapter that matches the current project stage; do not
treat every guideline as a rigid rule. Context, evidence, user needs, platform conventions, and testing decide
what is appropriate.
Core loop: understand the problem → research people and context → define the task → explore
options → prototype → test → build → measure → improve.
Contents
1. Foundations: UI, UX, product design
2. Human behaviour, cognition, and interaction principles
3. Product discovery and problem framing
4. UX research methods
5. Personas, jobs-to-be-done, journeys, and information architecture
6. User flows, task design, and navigation
7. Wireframes and prototyping
8. Visual design foundations
9. Layout, grids, spacing, and responsive design
10. Typography and content design
11. Colour, contrast, imagery, and iconography
12. Component design and interaction states
13. Forms, validation, errors, and feedback
14. Accessibility and inclusive design
15. Mobile, desktop, and platform-specific patterns
16. Motion, animation, sound, and microinteractions
17. Design systems, tokens, and documentation
18. Content design, UX writing, and localization
19. Trust, privacy, security, and ethical design
20. Performance, resilience, empty/loading/offline states
21. Testing, analytics, experimentation, and metrics
22. Developer handoff and design-to-code collaboration
23. AI-assisted design and responsible use
24. Common patterns by product type
25. Quality assurance and pre-launch checklist
26. Portfolio case studies and professional practice
27. Glossary
28. Resource library and source notes
1. Foundations: UI, UX, and product design
What each term means
Discipline
Main question
Typical work
User Experience (UX)
Can people achieve their goals
effectively, efficiently, and with an
acceptable level of satisfaction?
Research, task flows, information
architecture, usability tests, service
journeys, content structure.
User Interface (UI)
How is the product presented and
operated?
Layout, typography, colour, components,
visual hierarchy, interaction states,
responsive behaviour.
Interaction design (IxD)
How does the product respond to actions
over time?
Affordances, feedback, transitions,
control behaviour, error recovery.
Product design
Does the experience solve a real user
problem while supporting a sustainable
product?
Problem framing, UX/UI, prioritization,
metrics, collaboration with engineering
and business.
Service design
How do people experience the complete
service across channels and teams?
Frontstage/backstage maps, service
blueprints, policies, operational
processes.
Quality is multidimensional
• Useful: solves a real need rather than adding features for their own sake.

• Usable: tasks are understandable and achievable without unnecessary effort.

• Accessible: people with different abilities and input methods can use it.

• Desirable: visual and emotional qualities suit the product and its audience.

• Credible: claims, costs, permissions, and data use are clear and trustworthy.

• Reliable: failures are handled gracefully and users can recover.

• Feasible and viable: the solution can be built, maintained, and supported.

The design process is iterative, not a waterfall
Teams revisit research and definitions when evidence changes. A small project may use a lightweight version;
a regulated, high-risk, or complex product may require more formal research, accessibility review,
documentation, and validation.
Design principles to keep visible
• Make the next action clear; reduce unnecessary decisions.

• Use familiar patterns where they improve predictability; innovate when there is a meaningful reason.

• Keep users informed about system status and consequences.

• Prevent avoidable errors, but also make recovery easy.

• Prioritize the content and task over decorative effects.

• Design for varied abilities, devices, network conditions, language skills, and contexts.

• Consistency helps people learn; consistency does not mean every screen must look identical.

• Validate assumptions with evidence instead of defending personal taste.

2. Human behaviour, cognition, and interaction
principles
Practical cognitive concepts
Concept
Design implication
Recognition over recall
Show options, labels, recent items, examples, and contextual
help instead of forcing memory.
Mental models
Use terms and patterns that match how users understand the
task.
Cognitive load
Group related information, remove irrelevant choices, and
reveal advanced options when needed.
Attention and hierarchy
Give primary tasks clear visual priority; avoid competing calls
to action.
Hick–Hyman law
More choices can increase decision time; group and prioritize
choices rather than arbitrarily hiding them.
Fitts's law
Targets that are larger and easier to reach are generally easier
to select; consider edge placement and thumb reach.
Gestalt grouping
Proximity, similarity, continuity, and common region can
communicate relationships.
Feedback loop
An action should lead to perceivable system feedback: success,
progress, error, or next step.
Progressive disclosure
Show what is needed now; expose complexity when it becomes
relevant.
Error tolerance
Protect work, support undo, confirm destructive actions when
risk justifies it, and offer recovery.
Interaction principles
• Affordance: what action an object appears to support.

• Signifier: the cue that communicates where or how to act.

• Mapping: the relationship between a control and its effect.

• Constraint: a limit that prevents invalid or unsafe actions.

• Feedback: the system response after an action.

• Consistency: similar actions should behave similarly unless context explains the difference.

• User control: provide escape routes, cancellation, undo, and editable choices where feasible.

• Visibility: make available actions, system status, and important consequences discoverable.

Nielsen's usability heuristics—review prompts
1. Visibility of system status: does the product show what is happening?

2. Match between system and real world: is language natural and familiar?

3. User control and freedom: can people cancel, undo, or exit?

4. Consistency and standards: do conventions remain predictable?

5. Error prevention: can the design prevent common mistakes?

6. Recognition rather than recall: are choices and context visible?

7. Flexibility and efficiency: do shortcuts help experienced users without confusing beginners?

8. Aesthetic and minimalist design: is every element useful?

9. Help users recognize, diagnose, and recover from errors: are messages specific and actionable?

10. Help and documentation: can people find concise help when they need it?

3. Product discovery and problem framing
Start with the problem, not the screen
1. State the audience and situation: who is trying to do what, and when?

2. Describe the user problem without naming a preferred solution.

3. Gather evidence: interviews, analytics, support tickets, observation, competitor review, or field research.

4. Map constraints: time, technology, policy, privacy, accessibility, budget, operations.

5. Write assumptions and risks; distinguish known facts from guesses.

6. Define a measurable outcome and a baseline where possible.

7. Explore several solution directions before committing to one.

8. Test the riskiest assumption with the cheapest credible experiment.

Problem statement template
For [audience] who need to [goal] in [context], the current difficulty is [evidence-backed
problem]. This matters because [impact]. We will know progress is happening when
[measurable signal], without worsening [guardrail].
Opportunity and prioritization
• Separate user value, business value, implementation effort, risk, and confidence.

• Prioritization methods such as RICE or impact/effort matrices are discussion aids, not objective truth.

• Define non-goals so a project does not expand indefinitely.

• Consider the entire journey: discovery, onboarding, core task, support, cancellation, and return use.

• Include failure scenarios and less frequent but high-impact needs.

4. UX research methods
Choose the method based on the question
Question
Useful methods
What it helps reveal
What do people need or struggle with?
Interviews, contextual inquiry,
observation, diary study
Motivations, context, language,
workarounds, unmet needs.
How common is a problem?
Surveys, product analytics, support-ticket
coding
Prevalence or patterns—subject to
sampling and measurement limits.
Can people complete this task?
Moderated or unmoderated usability
tests
Comprehension, friction, errors, task
success.
Which option is clearer?
Comparative usability tests, preference
tests with caution
Observed differences between
alternatives.
Where do people expect information?
Card sorting, tree testing
Mental categories and findability.
What happens in the real environment?
Field studies, diary studies
Longitudinal and contextual behaviour.
Did a shipped change help?
A/B tests, before/after analysis,
qualitative follow-up
Observed impact under stated
assumptions.
Interview practice
• Recruit participants who reflect the actual audience and relevant situations.

• Ask about recent real behaviour: 'Tell me about the last time…' rather than only hypothetical preferences.

• Use open questions, neutral wording, and follow-up prompts.

• Do not lead participants toward the answer you hope to hear.

• Ask permission before recording; explain purpose, access, retention, and consent.

• Keep identifiable data minimal; anonymize notes when possible and set a deletion plan.

• Do not assume a few interviews establish population prevalence.

Usability test protocol
1. Write a research question and success criteria.

2. Prepare realistic, neutral tasks—not instructions that reveal the answer.

3. Pilot the session to find confusing wording and technical issues.

4. Ask participants to think aloud when appropriate; avoid rescuing too early.

5. Record task completion, time, errors, detours, confidence, and observed quotes.

6. Separate observations from interpretations and recommendations.

7. Report severity, frequency, impact, evidence, and uncertainty.

8. Retest after changes, especially for high-impact issues.

Research outputs
Useful deliverables may include a research plan, screener, consent statement, interview guide, notes, affinity
themes, insight statements, opportunity map, usability findings, and decision log. Make each artifact serve a
decision; avoid creating documents only to look busy.
5. Personas, jobs-to-be-done, journeys, and
information architecture
Personas and segments
Use evidence-based personas or audience segments when they help teams remember meaningful differences
in goals, constraints, abilities, or context. Avoid fictional precision, stereotypes, and personas based only on
demographic assumptions. Keep them updated as evidence changes.
Jobs-to-be-done
When [situation], I want to [motivation/action], so I can [desired outcome].
A job describes progress someone is trying to make. It is not automatically a feature request. Include
functional, emotional, and social dimensions when relevant.
Journey maps
• Map stages, user goals, actions, questions, touchpoints, emotions, pain points, and opportunities.

• Include before and after the screen: marketing, account setup, support, payment, returns, and real-world
operations.
• Use evidence labels so observed facts are not confused with hypotheses.

• Identify ownership and dependencies across teams.

Information architecture (IA)
• Organize content around user goals and understandable categories.

• Use labels that match users' language; avoid internal company terminology.

• Keep category boundaries meaningful and reduce ambiguous duplicates.

• Use card sorting to explore groupings and tree testing to evaluate findability.

• Create a sitemap and define page purpose, entry points, exit points, and relationships.

• Use breadcrumbs when they help people understand hierarchy; do not rely on them as the only navigation.

Navigation patterns
Pattern
Use considerations
Top navigation
Good for a small set of major destinations; keep labels short
and clear.
Sidebar
Useful for dense apps and dashboards; show current location
and sensible grouping.
Bottom navigation
Useful for a small number of top-level mobile destinations;
avoid stuffing every feature into it.
Tabs
Switch between peer views within one context; tabs should not
behave like unrelated page links.
Breadcrumbs
Show hierarchical location where hierarchy matters.
Search
Support useful suggestions, clear query state, no-results
recovery, and keyboard access.
Filters and sorting
Show active filters, result counts where useful, clear/reset
controls, and stable behaviour.
6. User flows, task design, and navigation
Map flows before polishing screens
A flow describes decisions and system states from entry to outcome. Include successful paths, validation
failures, permission denial, cancellation, session expiry, empty data, network failure, and return visits.
Flow checklist
• Where does the user enter? Can they arrive from a deep link or notification?

• What information is required, and why?

• Which steps can be skipped, saved, or completed later?

• What happens when a user goes back, refreshes, or closes the app?

• Is progress shown for multi-step processes?

• Can users correct earlier answers without restarting?

• Are irreversible actions clearly distinguished from reversible ones?

• Does the success state explain what happened and what comes next?

Navigation and orientation
Every major screen should help people answer: Where am I? What can I do here? How do I get back? What
changed after my action? Use current-state indicators, meaningful headings, consistent back behaviour, and
clear page titles.
7. Wireframes and prototyping
Choose fidelity intentionally
Fidelity
Best for
Watch out for
Sketch / low fidelity
Exploring structure, flow, and
alternatives quickly
Do not confuse placeholder content with
validated content needs.
Mid fidelity
Testing hierarchy, navigation, and task
sequence
Make interactions clear enough to test.
High fidelity
Visual direction, realistic interactions,
stakeholder review, usability validation
Polish can bias feedback; participants
may focus on aesthetics.
Coded prototype
Responsive behaviour, technical
feasibility, real data, performance,
accessibility
A prototype is not production-ready just
because it runs.
Prototype checklist
• Test the riskiest flow, not only the easiest or most attractive screen.

• Use realistic content length, error messages, and data variety.

• Include key states and transitions; make clickable elements behave consistently.

• Label prototype limitations so stakeholders do not mistake simulated behaviour for real functionality.

• Test with keyboard and touch when those inputs are in scope.

• Record what each prototype is meant to answer.

8. Visual design foundations
Hierarchy, contrast, alignment, repetition, proximity
• Hierarchy: guide attention using size, weight, spacing, placement, colour, and grouping.

• Contrast: create meaningful differences in emphasis; do not rely on colour alone to communicate status.

• Alignment: create visual order with consistent edges and baselines.

• Proximity: place related labels, controls, and content near each other.

• Repetition: repeat visual rules so the interface feels coherent.

• Whitespace: use empty space to clarify groups and improve scanning, not as decoration alone.

• Balance: distribute visual weight intentionally; asymmetry can work when hierarchy remains clear.

• Consistency: maintain shared rules while adapting to different tasks and contexts.

Composition and visual priority
A page typically needs one primary job, a clear heading, an obvious main action when relevant, and
supporting information in a sensible order. Use real content early: long names, prices, dates, translations, and
error messages often reveal layout failures hidden by short placeholder text.
Aesthetic direction
• Define a product personality and use it consistently in colour, typography, imagery, motion, and language.

• Use references to understand patterns and craft, not to copy another product's identity blindly.

• Choose decoration that supports meaning and brand; avoid effects that reduce legibility or speed.

• Treat consistency as a system, not as a requirement to make every section identical.

9. Layout, grids, spacing, and responsive
design
Layout system
• Use a spacing scale (for example, multiples of 4 or 8) as a starting point, then adjust when content requires it.

• Define content width, page margins, columns, gutters, and breakpoints based on content and behaviour—not
device names alone.
• Use grid and flex layouts for relationships; avoid positioning every element with arbitrary coordinates.

• Keep related items grouped and maintain predictable spacing between component internals and
neighbouring components.
• Let content wrap naturally; test long words, translated text, zoom, and large system fonts.

• Use responsive constraints and fluid sizing where appropriate rather than building one fixed layout per
screen.
Responsive design checklist
• Test narrow, medium, wide, and very wide viewports; also test awkward widths between common presets.

• Define what changes: columns, navigation, order, density, controls, and image crops.

• Do not merely shrink desktop UI; reassess task priorities and touch targets.

• Prevent horizontal scrolling for ordinary text/content except where two-dimensional content genuinely
requires it.
• Check zoom/reflow, keyboard navigation, sticky headers, overlays, and virtual keyboards.

• Make sure focus is not hidden behind sticky or fixed UI.

Spacing tokens example
Token
Illustrative value
Typical use
space-1
4 px
Tiny icon/label gap
space-2
8 px
Compact internal gap
space-3
12 px
Related controls
space-4
16 px
Default component padding
space-6
24 px
Section grouping
space-8
32 px
Major block separation
space-12
48 px
Large section spacing
space-16
64 px
Hero/major page rhythm
These values are a sample scale, not a universal standard. Establish tokens, then test them against the
content and brand.
10. Typography and content design
Typography system
• Choose typefaces for legibility, language coverage, available weights, licensing, and performance.

• Use a limited, intentional type scale; define display, heading, body, label, and helper styles.

• Set line-height for comfortable reading; avoid overly long line lengths in dense text.

• Distinguish headings semantically, not only visually.

• Use font weight, size, spacing, and colour as a coherent hierarchy.

• Do not make important information depend on tiny text, all caps, or low-contrast grey.

• Check numerals, punctuation, currency, dates, and multilingual glyphs.

• Allow text resizing and wrapping without clipping.

Content design principles
• Use concrete verbs for actions: 'Save changes' is clearer than 'Submit' when that is the actual result.

• Make labels specific and concise; explain unfamiliar terms at the point of need.

• Put the most important information first.

• Write error messages that state what happened, what needs fixing, and how to fix it.

• Do not use placeholder text as the only label for a field.

• Use sentence case unless a product's established language system requires otherwise.

• Use inclusive, plain language; explain acronyms and avoid unnecessary jargon.

• Keep content and design together: wording length affects layout and user decisions.

Text scale example
Role
Illustrative desktop size
Notes
Display
40–56 px
Use sparingly for large, high-level
statements.
H1
32–40 px
One clear page-level heading in most
page structures.
H2
24–32 px
Major sections.
H3
20–24 px
Subsections.
Body
16–18 px
Common baseline for web reading.
Small / helper
12–14 px
Use carefully; never hide essential
instructions here.
Type sizes are starting points, not rules. Platform conventions, language, viewing distance, accessibility
needs, and product density may require different values.
11. Colour, contrast, imagery, and iconography
Colour system
• Assign semantic roles: primary, secondary, surface, text, border, success, warning, danger, information,
focus, and disabled.
• Define foreground/background pairs and test them; do not select colours only by appearance on one display.

• Do not communicate errors, selection, or status using colour alone; add labels, icons, patterns, or shape
changes.
• Check light and dark themes, hover/focus/pressed/disabled states, and charts.

• Keep brand colours distinct from semantic status colours where possible.

• Use a contrast checker, then verify the rendered design and actual content.

Contrast quick reference
For WCAG 2.2 AA, normal text generally needs a contrast ratio of at least 4.5:1; large text generally needs at
least 3:1. Meaningful non-text UI components and graphical objects have a 3:1 requirement in relevant cases.
Exceptions and detailed conditions exist—consult the normative WCAG text and understanding documents
before claiming conformance.
Images and icons
• Use images with a clear purpose: explain, identify, demonstrate, or support emotion.

• Write alternative text for meaningful images; use empty alt text for purely decorative images in web
implementations.
• Maintain crop consistency and avoid misleading stock imagery.

• Use icons with recognizable meaning; pair unfamiliar icons with labels.

• Keep icon stroke, scale, optical alignment, and padding consistent.

• Do not use emoji as a substitute for a coherent icon system in critical controls.

• Provide captions/transcripts for relevant media and controls for motion or audio where required.

12. Component design and interaction states
Every interactive component needs a state model
State
Design question
Default
Is purpose and affordance clear?
Hover
Does it help pointer users without hiding essential information?
Focus-visible
Can keyboard users see exactly where they are?
Pressed / active
Is activation feedback immediate and perceivable?
Selected
Is the chosen option clear without colour alone?
Disabled
Is it clear why the action is unavailable, and is there a better
alternative?
Loading
Does the interface prevent accidental duplicate actions and
show progress where needed?
Success
Can the user tell the action completed and what changed?
Error
Is the problem explained and recoverable?
Empty
Does the screen explain why it is empty and what to do next?
Common components
Component
Design guidance
Button
Use action verbs; distinguish primary, secondary, tertiary, and
destructive actions. Avoid multiple competing primaries.
Link
Make destination/purpose clear; preserve expected browser
behaviour and visible focus.
Checkbox
Use for independent multi-select options; show selected state
and a sufficiently large label target.
Radio group
Use for one choice from a small visible set; make options
mutually exclusive.
Switch
Use for an immediate on/off setting; label the setting, not just
'on/off'.
Tabs
Use for peer views; preserve orientation, focus behaviour, and
selected state.
Dialog / modal
Use only when interrupting context is justified; provide a clear
title, close/cancel path, focus management, and sensible
Escape behaviour.
Tooltip
Use for supplemental short help, not essential instructions;
support keyboard and touch alternatives.
Toast / snackbar
Use for brief, non-critical status; do not make important
messages disappear before they can be read.
Pagination
Keep position and next/previous actions clear; preserve filters
and context.
Accordion
Use for optional sections; indicate expanded/collapsed state
and keep heading hierarchy meaningful.
Data table
Use meaningful headers, alignment, sorting labels, empty
states, responsive strategy, and accessible markup.
Cards
Use when a set of items shares a meaningful pattern; avoid
making the whole card clickable if it contains competing
controls.
Date picker
Support typed entry when possible, understandable formats,
keyboard operation, and locale conventions.
Search
Support query editing, clear action, suggestions, no-results
recovery, and useful result labels.
Component anatomy
Document the component's purpose, anatomy, variants, properties, states, keyboard behaviour, responsive
rules, content limits, accessibility notes, do/don't examples, and implementation status. Avoid inventing
variants before there is a real use case.
13. Forms, validation, errors, and feedback
Form design checklist
• Ask only for information needed for the task; explain why sensitive or unexpected fields are required.

• Use visible labels, suitable input types, and autocomplete attributes where applicable.

• Group related fields and order them in a way that matches the user's mental model.

• Mark required fields clearly and consistently; do not make users guess.

• Keep entered data when validation fails; show errors near the field and in a summary when useful.

• Do not rely only on colour to identify invalid fields.

• Use examples for ambiguous formats and state accepted formats before an error occurs.

• Choose sensible defaults only when they are safe and genuinely likely to be correct.

• Support password managers and accessible authentication patterns.

• On multi-step forms, show progress and allow review/editing where appropriate.

Error message formula
[What happened]. [What needs attention]. [How to fix it]. Example: “We couldn’t save your
changes. Check your internet connection and try again. Your text is still here.”
Feedback and confirmation
• Use inline feedback for local field issues, page-level feedback for overall submission, and system-level
announcements when assistive technology needs to hear a status update.
• Confirm destructive actions when the consequence is significant and undo is not practical.

• Prefer undo or reversible actions where feasible.

• After success, state the outcome; do not rely on a momentary animation alone.

• Prevent double submission and explain long-running operations.

14. Accessibility and inclusive design
The four WCAG principles
Principle
Practical meaning
Perceivable
Information and UI must be available through senses users can
use; provide text alternatives, captions, contrast, and
adaptable structure.
Operable
Controls and navigation must work with available input
methods, including keyboard; avoid traps and inaccessible
gestures.
Understandable
Language, navigation, and behaviour should be predictable and
comprehensible; identify errors and help users correct them.
Robust
Use semantic, interoperable implementation that works with
browsers and assistive technologies.
Accessibility review checklist
• All functionality works by keyboard; focus order is logical and visible.

• Focus is not obscured by sticky UI, dialogs, or banners.

• Headings, landmarks, labels, names, roles, and values are programmatically meaningful.

• Text and meaningful UI components meet applicable contrast requirements.

• Colour is not the only way to communicate information.

• Text can resize and reflow; layouts survive zoom and increased text spacing.

• Controls have understandable accessible names and adequate target size/spacing.

• Images have appropriate text alternatives; decorative imagery is ignored by assistive technology.

• Forms have persistent labels, clear instructions, accessible errors, and useful status messages.

• Motion can be reduced when appropriate; no content flashes dangerously.

• Video/audio has relevant captions, transcripts, controls, or alternatives.

• Authentication does not rely unnecessarily on memory puzzles or inaccessible cognitive tests.

• Touch, pointer, keyboard, screen reader, and voice interaction are considered for relevant audiences.

• Test with automated tools and human review; automated scans alone cannot prove accessibility.

Target size and contrast
WCAG 2.2 adds criteria including minimum target size (with defined exceptions), focus appearance/visibility,
dragging alternatives, and accessible authentication. Do not reduce accessibility to a single pixel rule: check
the exact criterion, exceptions, context, spacing, and applicable conformance level.
Inclusive research
• Include people with disabilities and varied contexts when possible and relevant.

• Offer multiple ways to participate and make research sessions accessible.

• Respect language, literacy, cultural context, low bandwidth, older devices, and temporary impairments.

• Do not treat one participant as representative of everyone with a similar disability.

• Treat accessibility as a design and engineering responsibility from the start, not a final polish step.

15. Mobile, desktop, and platform-specific
patterns
Mobile
• Prioritize the core task and content at narrow widths.

• Respect safe areas, system bars, keyboard overlays, and thumb reach.

• Use touch targets and spacing that reduce accidental activation.

• Ask for permissions at the point of need, explain why, and handle denial gracefully.

• Consider interruption, poor network, low battery, one-handed use, and orientation changes.

• Use platform conventions when they improve familiarity; do not copy platform UI blindly.

Desktop and web
• Support keyboard navigation, browser back/forward, direct URLs, refresh, and open-in-new-tab expectations.

• Design for mouse, trackpad, keyboard, zoom, window resizing, and variable content density.

• Use hover as an enhancement, never the only way to discover essential content.

• Provide clear focus, selection, context menus, and sensible keyboard shortcuts where appropriate.

• Keep tables and dashboards scannable; provide drill-down and filtering when density is high.

Cross-platform consistency
Preserve the product's identity and core concepts while respecting platform conventions. Shared design
tokens and principles can coexist with platform-specific navigation, gestures, typography, and control
behaviour.
16. Motion, animation, sound, and
microinteractions
Motion should explain
• Use motion to show cause and effect, spatial relationships, continuity, and progress.

• Keep transitions brief enough not to delay the task; avoid decorative animation that blocks interaction.

• Respect reduced-motion preferences and provide alternatives for essential animated information.

• Do not use motion as the only signal of success, error, or selection.

• Prevent layout shifts and avoid animations that create discomfort or distraction.

• Use loading indicators that match known progress; never imply a precise percentage without a meaningful
basis.
Microinteraction structure
Trigger → rules → feedback → loops/modes. Example: a save action is triggered; the app validates and sends
data; a visible status appears; retry or undo is offered if appropriate. Sound and haptics should be optional or
platform-appropriate and must not be the only feedback channel.
17. Design systems, tokens, and
documentation
What a design system contains
• Foundations: colour, typography, spacing, grid, radius, elevation, motion, iconography.

• Design tokens: named, reusable values for semantic roles rather than scattered hard-coded values.

• Components: reusable controls with documented variants, properties, and states.

• Patterns: combinations of components for recurring tasks such as sign-in, filtering, checkout, and error
recovery.
• Guidelines: content, accessibility, responsive, and interaction rules.

• Governance: ownership, versioning, contribution, review, deprecation, and change communication.

Token examples
Token
Example value
Purpose
color.text.primary
#172033
Primary readable text
color.surface.default
#FFFFFF
Default surface
color.action.primary
#2457D6
Primary action colour
color.status.error
#B42318
Error role; verify contrast with each
background
radius.control
8 px
Shared control corner radius
shadow.overlay
Defined token
Elevation for overlays
motion.duration.fast
120 ms
Small, non-blocking feedback
type.body.md
16/24 px
Body type size and line-height
Values are illustrative. Validate brand, contrast, platform fit, and implementation. Semantic token names let
themes change without rewriting every component.
System governance
• Use a clear source of truth and name tokens predictably.

• Version breaking changes; document migration steps.

• Record component status: stable, experimental, deprecated.

• Set contribution rules and avoid uncontrolled near-duplicate components.

• Align design and code libraries; track gaps between intended and shipped behaviour.

• Audit usage and remove unused tokens/components carefully.

18. Content design, UX writing, and
localization
Microcopy checklist
• Button labels describe the outcome of the action.

• Navigation labels use familiar nouns and stay consistent.

• Instructions appear before the user needs them.

• Errors avoid blame, explain recovery, and preserve dignity.

• Permission prompts explain the benefit and allow a real choice.

• Privacy, billing, renewal, cancellation, and destructive consequences are plain and prominent.

• Empty states explain what is missing and provide a useful next step.

• Notifications say what happened and what action, if any, is required.

Localization and internationalization
• Plan for text expansion, different word order, right-to-left layouts, and different scripts.

• Format dates, times, numbers, currency, addresses, names, and units according to locale.

• Do not assume everyone uses the same calendar, measurement system, or name format.

• Use translation-ready content structures and avoid concatenating fragments that cannot translate naturally.

• Test fonts, line breaks, input validation, search, sorting, and pluralization in supported languages.

• Use culturally appropriate imagery and avoid stereotypes.

19. Trust, privacy, security, and ethical design
Trustworthy interface behaviours
• Make pricing, recurring charges, trial end dates, cancellation, and refund conditions clear before
commitment.
• Ask only for data that serves a stated purpose; explain sensitive requests.

• Use permission prompts in context and respect refusal.

• Provide understandable privacy controls and account/data management.

• Distinguish ads, sponsored content, recommendations, and organic content.

• Make destructive actions and irreversible consequences clear.

• Do not use fake urgency, deceptive defaults, hidden fees, confusing opt-outs, or obstruction to cancellation.

• Explain AI-generated output and limitations where that information matters to the user's decision.

• Design for abuse prevention, reporting, blocking, moderation, and user safety in social products.

Dark-pattern audit questions
• Is the easiest path also a fair path, or does it manipulate people into an unwanted choice?

• Are decline and accept choices comparably visible and understandable?

• Can users cancel as easily as they sign up, subject to legitimate requirements?

• Are defaults transparent and reversible?

• Is scarcity/urgency genuine and verifiable?

• Are privacy choices specific rather than bundled in confusing ways?

• Does the interface exploit vulnerable users or encourage harmful overuse?

20. Performance, resilience, and system states
Design for imperfect conditions
State
What to provide
Loading
Immediate acknowledgement, skeletons where they match
layout, progress for known long tasks, cancellation where
possible.
Empty
Reason for no content, useful next step, clear distinction
between first-use and no-results.
Error
Plain explanation, preserved user input, retry or alternative
path, support details for persistent failures.
Offline
Explain what is available offline, preserve drafts, queue actions
only when safe, indicate sync status.
Partial failure
Show what succeeded and what did not; allow targeted retry
instead of forcing a full restart.
Permission denied
Explain the feature impact and offer a path to settings or a
non-permission alternative.
Session expired
Preserve work where safe; explain re-authentication and return
the user to the task.
Slow service
Avoid duplicate actions; show progress and let users know
whether the request is still running.
No results
Show query/filters, suggest edits, allow clearing filters, and
avoid dead ends.
Perceived and actual performance
Visual feedback can make waiting understandable but cannot compensate for a genuinely slow product.
Coordinate with engineering on loading budgets, image sizes, caching, progressive rendering, and failure
behaviour. Avoid skeleton screens that misrepresent the final layout or create unnecessary motion.
21. Testing, analytics, experimentation, and
metrics
Measure outcomes, not just activity
Metric type
Examples
Caution
Task success
Completion rate, critical errors,
abandonment
Define denominator, eligibility, and task
conditions.
Efficiency
Time on task, steps, repeated actions
Faster is not always better if quality or
safety drops.
Comprehension
Correct interpretation, confidence
calibration
Ask users to explain meaning; do not rely
only on self-report.
Satisfaction
CSAT, SUS, task ease ratings
Survey scores need context and
consistent administration.
Product outcome
Activation, retention, successful
transactions
Account for seasonality, acquisition mix,
and confounding factors.
Quality guardrails
Support contacts, refunds, accessibility
defects, privacy complaints
Monitor for unintended harm or unequal
effects.
Experimentation
• Write a hypothesis, primary metric, guardrails, and decision rule before running a test.

• Use randomization and appropriate analysis when running controlled experiments.

• Do not peek repeatedly and stop opportunistically without a plan.

• Check sample size, data quality, instrumentation, exposure, and novelty effects.

• Consider segment impacts and accessibility effects; an average gain can hide harm to a group.

• Use qualitative evidence to understand why a measured change happened.

• Do not use A/B testing to justify dark patterns or unsafe choices.

Design review
Review the real implementation, not only a static mockup. Include responsive layouts, interaction states,
content variations, keyboard focus, accessibility, network failures, analytics events, and visual regressions.
Record issues with reproduction steps, expected behaviour, actual behaviour, severity, and screenshots
where useful.
22. Developer handoff and design-to-code
collaboration
Handoff essentials
• Define the screen's purpose, target viewport, content source, and entry/exit routes.

• Document component variants, state transitions, interaction details, and responsive rules.

• Provide spacing, typography, colour, border, radius, elevation, and motion tokens.

• Specify behaviour for focus, keyboard, touch, loading, error, empty, disabled, and success states.

• Use real copy and representative data; identify truncation and overflow rules.

• Include accessibility requirements and expected semantics, not just appearance.

• Provide assets in appropriate formats, resolutions, and naming conventions.

• Document analytics events and meaningful properties without collecting unnecessary personal data.

• Agree on browser/platform support, performance expectations, and fallback behaviour.

• Review the implementation with developers and fix differences by impact.

Design QA issue template
Title: [component/screen + issue]
Environment: device, viewport, browser, input method
Steps: repeatable actions
Expected: intended behaviour
Actual: observed behaviour
Impact/severity: who is blocked and how
Evidence: screenshot/video/console details
Acceptance criteria: verifiable fix
A note on pixel perfection
Visual fidelity matters, but it is one dimension of quality. Prioritize issues that block tasks, break responsive
behaviour, create accessibility barriers, misrepresent information, or damage trust. Avoid spending
disproportionate time on tiny pixel differences while core states remain missing.
23. AI-assisted design and responsible use
• Use AI for idea generation, alternative layouts, draft copy, research synthesis assistance, and repetitive
documentation—not as a substitute for user evidence.
• Never treat generated personas, quotes, research findings, or metrics as real data.

• Verify factual claims, accessibility advice, and platform guidance against authoritative sources.

• Do not upload confidential customer data, unreleased designs, credentials, or personal data to tools without
authorization and a suitable data policy.
• Review generated assets for licensing, originality, bias, cultural assumptions, and accessibility.

• Prototype with real constraints; AI-generated screens often omit states, responsive logic, and meaningful
interaction behaviour.
• Ask AI to critique against a concrete checklist, then inspect the result yourself.

• Keep human accountability for product decisions, consent, privacy, and final quality.

Useful AI prompt structure
Context + audience + task + constraints + platform + brand traits + accessibility target +
required states + output format + evaluation checklist. Ask for assumptions to be labeled,
alternatives to be compared neutrally, and missing information to be identified.
24. Common patterns by product type
Marketing and landing pages
• State what the product is and who it helps early.

• Use one clear primary conversion goal per section.

• Provide evidence for claims: examples, pricing, policies, testimonials with permission, and contact details.

• Make navigation, mobile layout, form feedback, and performance reliable.

• Avoid fake counters, fabricated testimonials, and misleading urgency.

E-commerce
• Show total costs, delivery, returns, sizes, availability, and material information before purchase decisions.

• Make variants and stock status clear; retain selections when possible.

• Support guest checkout where appropriate, accessible forms, and transparent payment states.

• Make cart editing, promo-code feedback, order confirmation, cancellation, and returns understandable.

• Use honest product imagery and describe limitations or variation.

SaaS and dashboards
• Design around user roles and key jobs, not only database tables.

• Support onboarding, permissions, empty states, filters, saved views, and bulk actions.

• Use meaningful data labels, units, time ranges, and explanations for charts.

• Distinguish no data from failed data; show freshness and loading state.

• Provide undo or confirmation for high-impact bulk/destructive actions.

Social and messaging products
• Clarify privacy and audience before publishing or sharing.

• Make block, mute, report, and moderation controls discoverable.

• Design for message delivery states, retries, duplicate prevention, and poor connectivity.

• Communicate recording/camera/microphone permissions and active call states clearly.

• Provide accessible captions, controls, safety settings, and content reporting.

Booking and appointment products
• Show timezone, date, availability, price, cancellation terms, and required details clearly.

• Prevent double booking and distinguish pending from confirmed.

• Support rescheduling/cancellation and send clear confirmation details.

• Provide recovery when a slot disappears or payment fails.

Education and learning products
• Show learning goals, progress, feedback, and next steps.

• Use accessible media, captions/transcripts, readable content, and predictable navigation.

• Avoid making progress depend on colour or time pressure alone.

• Let learners review errors and understand why an answer is incorrect.

Health, finance, and other high-stakes products
Use stronger validation, transparent uncertainty, careful consent, clear provenance, and expert review. Avoid
ambiguous labels, hidden assumptions, manipulative defaults, and visualizations that overstate certainty.
Meet applicable legal, regulatory, safety, and professional requirements; a UI checklist alone cannot establish
compliance.
25. Quality assurance and pre-launch checklist
Product and UX
• Primary user goals and intended audience are explicit.

• Critical flows have been tested with representative users or credible substitutes, with limitations recorded.

• Navigation, labels, information architecture, and terminology are consistent.

• High-severity usability issues have owners and disposition decisions.

• All key success, failure, cancellation, empty, loading, and offline states are designed.

Visual and responsive
• Hierarchy, alignment, spacing, type, and colour follow a coherent system.

• Realistic long content, translations, zoom, and awkward viewport widths have been tested.

• Images, icons, crops, charts, and data labels are correct and purposeful.

• Light/dark themes and platform variants have been checked if supported.

• Motion does not block tasks or create avoidable discomfort.

Accessibility
• Keyboard navigation and visible focus work throughout.

• Semantic structure, accessible names, form labels, errors, and status messages are correct.

• Applicable contrast and target-size criteria have been checked.

• Zoom/reflow, reduced motion, screen reader basics, captions, and text alternatives have been reviewed.

• Automated scans are supplemented with human testing and relevant assistive technology checks.

Content, trust, and data
• Pricing, renewals, cancellation, permissions, privacy, and destructive consequences are clear.

• Claims and testimonials are truthful and supported.

• Analytics collection is documented and minimized.

• Sensitive information is not exposed in logs, screenshots, URLs, or notifications without a clear reason.

• Consent and data retention are appropriate for the product and jurisdiction.

Engineering and operations
• Loading, error, timeout, retry, partial failure, and session expiry are handled.

• Controls prevent duplicate submissions where necessary.

• Performance, browser/platform support, and asset optimization have been checked.

• Analytics events are validated; critical user journeys are monitored.

• Support routes, rollback plans, and post-launch ownership exist.

26. Portfolio case studies and professional
practice
A credible case study
1. Context: product, audience, constraints, timeline, team, and your actual role.

2. Problem: evidence and why it mattered; do not present assumptions as facts.

3. Research: methods, participants/context, findings, and limitations.

4. Definition: user needs, task flows, requirements, and success metrics.

5. Exploration: multiple concepts and trade-offs, not only the final screen.

6. Design: wireframes, prototypes, design system, and important interaction states.

7. Validation: test setup, findings, iteration, and unresolved risks.

8. Outcome: measured results where available; otherwise state what was delivered and what remains
unvalidated.
9. Reflection: what changed your mind, what you would do next, and what you learned.

Ethics of portfolio work
• Do not fabricate client names, user interviews, metrics, testimonials, or production status.

• Clarify personal versus team contributions.

• Get permission before showing confidential work and anonymize private data.

• Explain constraints and trade-offs rather than claiming every decision is universally correct.

• Show the final UI alongside flows, states, and reasoning; beautiful mockups alone do not prove UX quality.

27. Glossary
Term
Meaning
Affordance
A property suggesting how something may be used.
Accessibility
Design and implementation that enable people with disabilities
to perceive, understand, navigate, and interact.
A/B test
A controlled comparison of variants with a defined assignment
and measurement approach.
Breakpoint
A layout threshold where responsive behaviour changes.
Cognitive load
Mental effort required to process information and act.
Component
A reusable interface element with defined behaviour and
variants.
Design token
A named design decision such as a semantic colour or spacing
value.
Empty state
A screen or region with no content/results and a need for
explanation or next action.
Heuristic evaluation
Expert review against established usability principles.
Information architecture
How content and functions are structured and labeled.
Interaction design
Design of actions, responses, states, and transitions.
Journey map
A representation of a person's stages, actions, needs, and pain
points across an experience.
Mental model
A person's internal understanding of how something works.
Microcopy
Short interface text such as labels, instructions, and errors.
Persona
An evidence-informed representation of a meaningful audience
pattern.
Prototype
A representation of a product used to explore or test a concept.
Responsive design
Layouts and interactions that adapt to different viewport sizes
and contexts.
Semantic HTML
HTML elements chosen for their meaning and built-in
behaviour, not only appearance.
Task success
A measure of whether a person completed a defined task under
stated conditions.
Usability
How effectively, efficiently, and satisfactorily specified users
can achieve specified goals in context.
User flow
A sequence of screens, actions, and decisions used to complete
a task.
Wireframe
A simplified representation of screen structure and hierarchy.
WCAG
Web Content Accessibility Guidelines, a W3C accessibility
standard.
UX writing
Designing interface language to help people understand and
complete tasks.
28. Resource library and source notes
The following are starting points for deeper study. Standards and platform guidance can change; check the
current source before applying a specific requirement or claiming compliance. Curated lists are useful for
discovery but may contain outdated links or mixed-quality recommendations.
Primary standards and platform guidance
Resource
URL
Why use it
W3C — WCAG 2.2
Understanding
https://www.w3.org/WAI/WCAG22/Understanding
/
Detailed explanations of accessibility guidelines
and success criteria.
W3C — WCAG overview
https://www.w3.org/WAI/standards-guidelines/wc
ag/
Overview, standards, quick reference, and
supporting documents.
W3C — What's new in WCAG
2.2
https://www.w3.org/WAI/standards-guidelines/wc
ag/new-in-22/
Summary of additional criteria introduced in
WCAG 2.2.
Apple Human Interface
Guidelines
https://developer.apple.com/design/human-inter
face-guidelines/
Platform-specific foundations, patterns,
components, and inputs.
Material Design
https://m3.material.io/
Design foundations, components, accessibility,
and implementation guidance.
U.S. Web Design System
https://designsystem.digital.gov/
Reusable patterns and accessibility-conscious
components for government services.
GOV.UK Design System
https://design-system.service.gov.uk/
Components, patterns, content guidance, and
tested service conventions.
Nielsen Norman Group — 10
usability heuristics
https://www.nngroup.com/articles/ten-usability-h
euristics/
Widely used expert-review prompts for usability.
Laws of UX
https://lawsofux.com/
Accessible summaries of psychology concepts
commonly used in design.
Figma Learn
https://help.figma.com/hc/en-us/categories/3600
02051613-Learn-design
Product documentation and learning material for
Figma workflows.
GitHub curated lists
Repository
URL
Coverage
Awesome UX — gschema
https://github.com/gschema/awesome-ux
UX research, templates, books, heuristics, tools,
and blogs.
Awesome UX — uxreview
https://github.com/uxreview/awesome-ux
Research, prototyping, testing, design tools,
and inspiration.
Awesome UI — coderdiaz
https://github.com/coderdiaz/awesome-ui
UI principles, techniques, tools, patterns, and
learning resources.
Awesome UI Guides
https://github.com/willyp713/awesome-ui-guides
Component-by-component guidance for forms,
navigation, buttons, modals, and more.
UI/UX Resources — Pediomo
https://github.com/Pediomo/UI-UX-resources
Books, communities, tools, courses, and
case-study resources.
Community discussions and peer learning
• Reddit r/UIUX: https://www.reddit.com/r/UIUX/ — questions and peer discussion; treat advice as personal
experience, not authoritative standards.
• Reddit r/userexperience: https://www.reddit.com/r/userexperience/ — UX research, process, and practice
discussions.
• Reddit r/UX_Design: https://www.reddit.com/r/UX_Design/ — design learning and career discussions.

• Compare community advice with standards, user evidence, and platform documentation before adopting it.

Books often recommended for foundations
• The Design of Everyday Things — Don Norman: affordances, feedback, mental models, and human-centred
design.
• Don't Make Me Think — Steve Krug: practical usability and web navigation.

• The Elements of User Experience — Jesse James Garrett: a structured view of UX layers.

• Lean UX — Jeff Gothelf and Josh Seiden: collaborative, iterative product design.

• About Face — Alan Cooper and co-authors: interaction design concepts and practice.

How to judge a resource
• Is it current, and does it cite standards or research where relevant?

• Does it explain context and exceptions rather than claiming one rule fits every product?

• Does it distinguish evidence from opinion and marketing?

• Can you test the advice with users, accessibility checks, or implementation?

• Does the source explain who the guidance is for and what problem it solves?

Final working checklist
1. Write the user problem and desired outcome before choosing a layout.

2. Choose research methods that answer the actual uncertainty.

3. Map the complete flow, including failure and recovery.

4. Build a clear visual and interaction system before scaling screens.

5. Design all meaningful states and content variations.

6. Check accessibility early and throughout.

7. Test with people and inspect real implementation.

8. Measure outcomes with guardrails and honest limitations.

9. Document decisions and keep improving after launch.

The goal is not to memorize every rule. The goal is to build a repeatable process for making
informed design decisions, testing them with people, and improving the product responsibly.
