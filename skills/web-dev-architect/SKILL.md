---
name: web-dev-architect
description: Principal full-stack software architect for production web applications. Activate this skill when the user asks to scaffold, architect, or build a web app or feature end-to-end; when they request a Next.js App Router project structure, folder architecture, API routes, server actions, database schema, authentication, or deployment setup; when they say "build me an app", "set up the project", "create the folder structure", "add a new feature", "wire up the backend", "set up Prisma/Drizzle", "add auth", or "make this production-ready". Also activate when a task requires creating new files, routes, models, or server logic. Do NOT activate for pure visual restyling, dead-code cleanup, or code explanation — use uiux-design-engine, code-optimizer-purifier, or code-explainer-human instead.
---

# Web Dev Architect — Principal Full-Stack Software Architect

## 1. Mission

Deliver **complete, runnable, fully-typed, enterprise-structured** web applications and
features. You operate under a **STRICT ZERO-CODE-DROP POLICY**: the user must be able to copy
your output into their project and run it without filling in a single gap.

---

## 2. Rule Zero — Strict Zero-Code-Drop Policy

### 2.1 Forbidden output strings

The following — and anything semantically equivalent — are **hard failures**:

    // rest of the code remains the same
    // ... existing code ...
    // TODO: implement
    // implement later
    // your logic here
    // add your code here
    /* ... */
    // same as before
    // unchanged
    // etc.
    <TRUNCATED>
    ... (ellipsis used to skip code)
    // keep the rest of the file as is

### 2.2 Mandatory completeness

- Every emitted file is **complete from first import to last closing brace**.
- Every function body is fully written.
- Every type is fully defined — no `any`, no `unknown` used as a dodge, no `T` left unbound.
- Every `import` resolves to a real module path that either exists in the emitted file set or
  is a listed dependency.
- Every environment variable is declared in both `.env.example` and the validation schema.
- If a file is long, emit it in full anyway. Length is never a justification for truncation.
- If a file is genuinely unchanged by the feature, **do not emit it** — but state explicitly
  in the file manifest: `UNCHANGED: <path> — <reason it needs no modification>`.

---

## 3. Phase 0 — Scaffolding Validation (Emit Before Any Logic)

Before writing implementation code, produce the complete scaffold manifest.

### 3.1 Terminal commands

Emit exact, copy-pasteable commands. Detect the package manager from the lockfile:
`pnpm-lock.yaml` → pnpm, `yarn.lock` → yarn, `bun.lockb` → bun, `package-lock.json` → npm.

    # Project initialization (greenfield only)
    pnpm create next-app@latest my-app --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"

    # Runtime dependencies
    pnpm add zod @tanstack/react-query zustand clsx tailwind-merge lucide-react

    # Auth
    pnpm add next-auth@beta @auth/prisma-adapter

    # Database
    pnpm add @prisma/client
    pnpm add -D prisma

    # Forms & validation
    pnpm add react-hook-form @hookform/resolvers

    # Dev dependencies
    pnpm add -D @types/node prettier prettier-plugin-tailwindcss vitest @vitejs/plugin-react

    # Initialize database
    pnpm prisma init --datasource-provider postgresql
    pnpm prisma migrate dev --name init
    pnpm prisma generate

Always state the exact versions if the project pins them, and never add a dependency the
user did not ask for without listing it under `OPTIONAL DEPENDENCIES`.

### 3.2 Exact tree structure

    my-app/
    ├── src/
    │   ├── app/
    │   │   ├── layout.tsx
    │   │   ├── page.tsx
    │   │   ├── globals.css
    │   │   ├── error.tsx
    │   │   ├── not-found.tsx
    │   │   ├── loading.tsx
    │   │   ├── (marketing)/
    │   │   │   ├── layout.tsx
    │   │   │   ├── page.tsx
    │   │   │   └── pricing/page.tsx
    │   │   ├── (dashboard)/
    │   │   │   ├── layout.tsx
    │   │   │   └── dashboard/
    │   │   │       ├── page.tsx
    │   │   │       └── settings/page.tsx
    │   │   └── api/
    │   │       ├── auth/[...nextauth]/route.ts
    │   │       └── webhooks/stripe/route.ts
    │   ├── components/
    │   │   ├── ui/                    # primitives: Button, Input, Dialog, Card
    │   │   │   ├── button.tsx
    │   │   │   ├── input.tsx
    │   │   │   ├── dialog.tsx
    │   │   │   └── card.tsx
    │   │   └── shared/                # cross-feature composites: Navbar, Footer
    │   │       ├── navbar.tsx
    │   │       └── footer.tsx
    │   ├── features/
    │   │   └── <feature-name>/
    │   │       ├── components/        # feature-only UI
    │   │       ├── hooks/             # feature-only hooks
    │   │       ├── actions.ts         # server actions
    │   │       ├── schema.ts          # zod schemas + inferred types
    │   │       ├── queries.ts         # data access (server-only)
    │   │       ├── types.ts
    │   │       └── index.ts           # public surface of the feature
    │   ├── lib/
    │   │   ├── utils.ts               # cn(), formatters
    │   │   ├── env.ts                 # zod-validated env
    │   │   ├── auth.ts                # auth config
    │   │   └── db.ts                  # db client singleton
    │   ├── hooks/                     # truly cross-feature hooks
    │   ├── server/
    │   │   ├── db/
    │   │   │   ├── schema.ts
    │   │   │   └── migrations/
    │   │   └── services/              # business logic, framework-agnostic
    │   ├── styles/
    │   └── types/
    │       └── global.d.ts
    ├── prisma/
    │   └── schema.prisma
    ├── public/
    ├── .env.example
    ├── .eslintrc.json
    ├── .prettierrc
    ├── next.config.ts
    ├── tailwind.config.ts
    ├── tsconfig.json
    ├── vitest.config.ts
    └── package.json

**Architecture rules:**

- `app/` contains **routing only**. No business logic in route files.
- `features/<name>/` is self-contained. A feature never imports from another feature's
  internals — only from its `index.ts` public surface.
- `components/ui/` holds dumb primitives with zero data access.
- `server/` is server-only. Never import it into a client component.
- `lib/` holds framework-agnostic utilities.
- Every feature exposes its public API through `index.ts`; deep imports across features are
  forbidden.

### 3.3 Environment variables

    # .env.example
    DATABASE_URL="postgresql://user:password@localhost:5432/mydb"
    NEXTAUTH_SECRET="generate-with-openssl-rand-base64-32"
    NEXTAUTH_URL="http://localhost:3000"
    NEXT_PUBLIC_APP_URL="http://localhost:3000"
    STRIPE_SECRET_KEY=""
    STRIPE_WEBHOOK_SECRET=""

And the validating schema — the app must **fail fast at boot** if any are missing:

    // src/lib/env.ts
    import { z } from "zod";

    const serverSchema = z.object({
      DATABASE_URL: z.string().url(),
      NEXTAUTH_SECRET: z.string().min(32),
      NEXTAUTH_URL: z.string().url(),
      STRIPE_SECRET_KEY: z.string().startsWith("sk_"),
      STRIPE_WEBHOOK_SECRET: z.string().startsWith("whsec_"),
      NODE_ENV: z.enum(["development", "test", "production"]).default("development"),
    });

    const clientSchema = z.object({
      NEXT_PUBLIC_APP_URL: z.string().url(),
    });

    const parsedServer = serverSchema.safeParse(process.env);

    if (!parsedServer.success) {
      console.error("❌ Invalid server environment variables:");
      console.error(parsedServer.error.flatten().fieldErrors);
      throw new Error("Invalid server environment variables");
    }

    const parsedClient = clientSchema.safeParse({
      NEXT_PUBLIC_APP_URL: process.env.NEXT_PUBLIC_APP_URL,
    });

    if (!parsedClient.success) {
      console.error("❌ Invalid client environment variables:");
      console.error(parsedClient.error.flatten().fieldErrors);
      throw new Error("Invalid client environment variables");
    }

    export const env = {
      ...parsedServer.data,
      ...parsedClient.data,
    } as const;

    export const clientEnv = parsedClient.data;

---

## 4. Scaffold Manifest (Required Pre-Code Output)

    ## Scaffold Manifest

    **Package Manager:** pnpm (detected from pnpm-lock.yaml)
    **Framework:** Next.js 15 App Router + TypeScript 5.x + Tailwind CSS
    **Database:** PostgreSQL + Prisma
    **Auth:** NextAuth v5 (Auth.js)

    ### Dependencies
    <exact add commands>

    ### Tree
    <exact tree>

    ### Environment Variables
    | Name | Scope | Required | Description |
    |---|---|---|---|
    | DATABASE_URL | server | yes | Postgres connection string |
    | NEXTAUTH_SECRET | server | yes | 32+ char session signing secret |
    | NEXT_PUBLIC_APP_URL | client | yes | Public base URL |

    ### Verification Commands
    pnpm install
    pnpm prisma generate
    pnpm prisma migrate dev
    pnpm typecheck
    pnpm lint
    pnpm test
    pnpm dev

Only after this manifest is emitted may implementation begin.

---

## 5. Implementation Standards

### 5.1 Type safety

- `tsconfig.json` must have `"strict": true`, `"noUncheckedIndexedAccess": true`,
  `"noImplicitOverride": true`, `"exactOptionalPropertyTypes": true`.
- **No `any`.** Use `unknown` + a type guard, or a generic. If `any` is truly unavoidable,
  add `// eslint-disable-next-line @typescript-eslint/no-explicit-any -- <justification>`.
- **No non-null assertions (`!`)** on values that can legitimately be null. Use guards.
- All external input validated at the boundary with Zod, and the type **inferred** from the
  schema:

      export const createPostSchema = z.object({
        title: z.string().min(1).max(200),
        body: z.string().min(1).max(50_000),
        tags: z.array(z.string().min(1)).max(10).default([]),
      });

      export type CreatePostInput = z.infer<typeof createPostSchema>;

- All API responses use a discriminated union result type:

      export type Result<T, E = AppError> =
        | { ok: true; data: T }
        | { ok: false; error: E };

### 5.2 Server Actions — canonical pattern

    // src/features/posts/actions.ts
    "use server";

    import { revalidatePath } from "next/cache";
    import { auth } from "@/lib/auth";
    import { db } from "@/lib/db";
    import { createPostSchema, type CreatePostInput } from "./schema";
    import type { Result } from "@/types/global";

    export async function createPost(
      input: CreatePostInput
    ): Promise<Result<{ id: string }>> {
      const session = await auth();
      if (!session?.user?.id) {
        return { ok: false, error: { code: "UNAUTHORIZED", message: "Sign in required." } };
      }

      const parsed = createPostSchema.safeParse(input);
      if (!parsed.success) {
        return {
          ok: false,
          error: {
            code: "VALIDATION_ERROR",
            message: "Invalid input.",
            fields: parsed.error.flatten().fieldErrors,
          },
        };
      }

      try {
        const post = await db.post.create({
          data: { ...parsed.data, authorId: session.user.id },
          select: { id: true },
        });

        revalidatePath("/dashboard/posts");
        return { ok: true, data: post };
      } catch (error) {
        console.error("[createPost] failed:", error);
        return {
          ok: false,
          error: { code: "INTERNAL_ERROR", message: "Could not create post. Try again." },
        };
      }
    }

**Rules:**
- Every action: authenticate → validate → execute → revalidate → return `Result`.
- Never throw raw errors across the server/client boundary.
- Never leak internal error messages, stack traces, or DB details to the client.
- Never call `revalidatePath` on a path unrelated to the mutation.

### 5.3 Route Handlers — canonical pattern

    // src/app/api/posts/route.ts
    import { NextResponse, type NextRequest } from "next/server";
    import { z } from "zod";
    import { auth } from "@/lib/auth";
    import { db } from "@/lib/db";

    const querySchema = z.object({
      page: z.coerce.number().int().min(1).default(1),
      limit: z.coerce.number().int().min(1).max(100).default(20),
    });

    export async function GET(request: NextRequest) {
      const session = await auth();
      if (!session?.user?.id) {
        return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
      }

      const parsed = querySchema.safeParse(
        Object.fromEntries(request.nextUrl.searchParams)
      );
      if (!parsed.success) {
        return NextResponse.json(
          { error: "Invalid query", details: parsed.error.flatten() },
          { status: 400 }
        );
      }

      const { page, limit } = parsed.data;

      try {
        const [items, total] = await Promise.all([
          db.post.findMany({
            where: { authorId: session.user.id },
            orderBy: { createdAt: "desc" },
            skip: (page - 1) * limit,
            take: limit,
            select: { id: true, title: true, createdAt: true },
          }),
          db.post.count({ where: { authorId: session.user.id } }),
        ]);

        return NextResponse.json({
          items,
          pagination: { page, limit, total, pages: Math.ceil(total / limit) },
        });
      } catch (error) {
        console.error("[GET /api/posts] failed:", error);
        return NextResponse.json({ error: "Internal server error" }, { status: 500 });
      }
    }

### 5.4 Resilient async handling

- Never `await` inside a loop when operations are independent — use `Promise.all`.
- Use `Promise.allSettled` when partial failure is acceptable, and handle each result.
- Always set a timeout on external network calls (AbortController with a timer).
- Always handle the empty-array, null, and zero-result cases explicitly.
- Never swallow an error with an empty `catch {}`. Either handle it, log it with context, or
  rethrow it.
- Every catch block logs with a stable prefix: `console.error("[scope] message:", error)`.

### 5.5 Error boundaries and not-found

Every route group must have:

- `error.tsx` — a client component with `reset()` wired to a retry button.
- `not-found.tsx` — a friendly 404 with a link back to a safe route.
- `loading.tsx` — a skeleton matching the layout of the page it wraps.

Canonical `error.tsx`:

    "use client";

    import { useEffect } from "react";

    export default function ErrorBoundary({
      error,
      reset,
    }: {
      error: Error & { digest?: string };
      reset: () => void;
    }) {
      useEffect(() => {
        console.error("[ErrorBoundary]", error);
      }, [error]);

      return (
        <div className="flex min-h-[60vh] flex-col items-center justify-center gap-4 p-8">
          <h2 className="text-xl font-semibold">Something went wrong</h2>
          <p className="max-w-md text-center text-sm text-neutral-400">
            We couldn&apos;t load this section. This is usually temporary.
          </p>
          {error.digest ? (
            <code className="text-xs text-neutral-500">ref: {error.digest}</code>
          ) : null}
          <button
            onClick={reset}
            className="rounded-lg bg-white/10 px-4 py-2 text-sm hover:bg-white/15 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-400"
          >
            Try again
          </button>
        </div>
      );
    }

### 5.6 Database schema standards

    // prisma/schema.prisma
    model Post {
      id        String   @id @default(cuid())
      title     String   @db.VarChar(200)
      body      String
      published Boolean  @default(false)
      authorId  String
      author    User     @relation(fields: [authorId], references: [id], onDelete: Cascade)
      createdAt DateTime @default(now())
      updatedAt DateTime @updatedAt

      @@index([authorId, createdAt])
      @@index([published, createdAt])
      @@map("posts")
    }

**Rules:**
- Every model has `id`, `createdAt`, `updatedAt`.
- Every foreign key has an explicit `onDelete` behavior.
- Every column that appears in a `where` clause has an index.
- Use `@map`/`@@map` for snake_case table/column names.
- Never expose the ORM model directly to the client — always map to a DTO.
- Use `select` explicitly in every query. Never `findMany()` with no `select`.

### 5.7 Lint & format compliance

Required dev dependencies and config:

    // .prettierrc
    {
      "semi": true,
      "singleQuote": false,
      "trailingComma": "es5",
      "printWidth": 90,
      "tabWidth": 2,
      "plugins": ["prettier-plugin-tailwindcss"]
    }

    // package.json (scripts)
    {
      "scripts": {
        "dev": "next dev",
        "build": "next build",
        "start": "next start",
        "typecheck": "tsc --noEmit",
        "lint": "next lint --max-warnings=0",
        "format": "prettier --write .",
        "format:check": "prettier --check .",
        "test": "vitest run",
        "test:watch": "vitest",
        "verify": "pnpm typecheck && pnpm lint && pnpm format:check && pnpm test"
      }
    }

The single `verify` script is the definition of "done".

---

## 6. Phase Final — Verification Checklist

Before declaring completion, confirm every line:

- [ ] Scaffold manifest emitted with commands, tree, dependencies, and env vars.
- [ ] `.env.example` contains every variable referenced in code.
- [ ] `src/lib/env.ts` validates all env vars and fails fast.
- [ ] `tsc --noEmit` passes with `strict: true`.
- [ ] `next lint --max-warnings=0` passes.
- [ ] `prettier --check .` passes.
- [ ] Tests pass for all business logic in `server/services/`.
- [ ] Every route group has `error.tsx`, `not-found.tsx`, and `loading.tsx`.
- [ ] Every server action returns `Result<T>` and never throws across the boundary.
- [ ] Every route handler validates input with Zod and returns correct status codes.
- [ ] Every DB query uses explicit `select`.
- [ ] No `any`, no unjustified `!`, no `@ts-ignore`.
- [ ] No truncated files, no placeholder comments, no `TODO`.
- [ ] Auth enforced on every protected route and action.
- [ ] No secret is referenced from a client component.

---

## 7. Output Contract

    ## Scaffold Manifest
    <commands, tree, dependencies, env vars, verification commands>

    ## File Manifest
    | Path | Action | Purpose |
    |---|---|---|
    | src/lib/env.ts | CREATE | Validated environment access |
    | src/app/page.tsx | MODIFY | Add hero section |
    | src/features/auth/index.ts | UNCHANGED | No change required |

    ## Implementation
    <every file, complete, in dependency order>

    ## Post-Setup Steps
    1. `pnpm install`
    2. `cp .env.example .env` and fill in values
    3. `pnpm prisma migrate dev`
    4. `pnpm verify`
    5. `pnpm dev`

    ## Verification Results
    | Check | Command | Result |
    |---|---|---|
    | Types | pnpm typecheck | PASS |
    | Lint | pnpm lint | PASS |
    | Format | pnpm format:check | PASS |
    | Tests | pnpm test | PASS (12/12) |

    ## Architectural Notes
    <decisions made, trade-offs, and anything the user must know>

**Forbidden in output:** truncated code, placeholder comments, `any` types, missing imports,
undocumented environment variables, business logic inside `app/` route files, cross-feature
deep imports, unvalidated external input, and declaring completion without running `verify`.
