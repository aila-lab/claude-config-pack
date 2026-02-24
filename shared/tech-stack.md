# 🔧 Shared Tech Stack — Single Source of Truth

> **Version**: 2.0 | **Updated**: 2026-02 | **All agents MUST reference this file**

## Frontend
| Category | Technology | Version |
|----------|-----------|---------|
| Framework | React | 19.x |
| Meta-Framework | Next.js (App Router) | 15.x |
| Static/Content | Astro | 5.x |
| Mobile | React Native + Expo | 0.77+ / SDK 52 |
| Language | TypeScript | 5.7+ |
| State | Zustand | 5.x |
| Data Fetching | TanStack Query | 5.x |
| Forms | React Hook Form + Zod | 7.x |
| Styling | Tailwind CSS | 4.x |
| Animation | Framer Motion / Reanimated 3 | 11.x / 3.x |
| UI Kit | shadcn/ui | latest |
| Icons | Lucide React | latest |
| Charts | Recharts / D3.js | 2.x / 7.x |

## Backend
| Category | Technology | Version |
|----------|-----------|---------|
| Runtime | Node.js / Bun | 22 LTS / 1.2+ |
| Framework | Hono / Express / Fastify | 4.x / 4.x / 5.x |
| ORM | Prisma / Drizzle | 6.x / 0.36+ |
| Validation | Zod | 3.x |
| Auth | Supabase Auth / Clerk / Auth.js | latest |
| Queue | BullMQ / Inngest | 5.x / 3.x |
| Real-time | Socket.io / Hono WebSocket | 4.x |
| API Docs | Swagger / OpenAPI 3.1 | latest |

## Database & Storage
| Category | Technology | Version |
|----------|-----------|---------|
| Primary DB | PostgreSQL | 17 |
| BaaS | Supabase | latest |
| Cache | Redis / Upstash | 7.x |
| Vector DB | Pinecone / Chroma / Qdrant | latest |
| Object Storage | S3 / Cloudflare R2 | - |
| File Upload | UploadThing / Supabase Storage | latest |

## AI/ML
| Category | Technology | Version/Model |
|----------|-----------|---------------|
| Primary LLM | Claude (Anthropic) | claude-sonnet-4-5-20250929 |
| Secondary LLM | OpenAI GPT | gpt-4o / gpt-4o-mini |
| Embeddings | text-embedding-3-small | latest |
| Image Gen | DALL-E 3 / Flux / Stable Diffusion 3.5 | latest |
| Video Gen | Runway Gen-4 / Sora 2 / Veo 3.1 | latest |
| Voice | ElevenLabs / OpenAI TTS | latest |
| Orchestration | LangChain / Vercel AI SDK | 0.3+ / 4.x |
| Local Models | Ollama + Llama 3.3 / Mistral | latest |

## Infrastructure & DevOps
| Category | Technology | Version |
|----------|-----------|---------|
| Hosting | Vercel / Railway / Fly.io | - |
| CI/CD | GitHub Actions | latest |
| Containers | Docker + Docker Compose | 27+ |
| Orchestration | Kubernetes (k8s) | 1.31+ |
| IaC | Terraform / Pulumi | 1.10+ / 3.x |
| Monitoring | Sentry / Grafana / Prometheus | latest |
| Logging | Pino / Winston → Loki | latest |
| DNS/CDN | Cloudflare | - |
| Secrets | Doppler / Infisical | latest |

## Development Tools
| Category | Technology |
|----------|-----------|
| Editor | VS Code / Cursor / WebStorm |
| Linter | ESLint 9 (flat config) + Biome |
| Formatter | Prettier / Biome |
| Testing | Vitest / Jest / Playwright / Supertest |
| Git Hooks | Husky + lint-staged |
| Monorepo | Turborepo / Nx |
| Package Manager | pnpm / bun |
| API Testing | Bruno / Hoppscotch |

## Design & Creative Tools
| Category | Technology |
|----------|-----------|
| UI/UX Design | Figma |
| Prototyping | Figma / ProtoPie |
| Motion/Animation | After Effects / Jitter / Rive / Lottie |
| Video Editing | DaVinci Resolve / CapCut / Descript / VEED |
| Video Generation | Runway Gen-4.5 / Sora 2 / Veo 3.1 / Kling 2.0 |
| Image Editing | Photoshop / Affinity Photo 2 |
| Vector Graphics | Illustrator / Affinity Designer 2 |
| 3D | Blender 4.x / Spline / Cinema 4D |
| Social Media | Canva / Buffer / Metricool / Later |

## Website Building
| Category | Technology |
|----------|-----------|
| Framework | Next.js / Astro / SvelteKit |
| CMS | Sanity / Strapi / Payload CMS / Contentful |
| E-commerce | Shopify / Medusa.js / Saleor |
| Forms | Formbricks / Tally |
| Analytics | PostHog / Plausible / Vercel Analytics |
| A/B Testing | PostHog / Growthbook |
| SEO | next-seo / @astrojs/sitemap |
| Email | Resend / React Email / Loops |

## Coding Standards
- **TypeScript strict mode** — always enabled, `noUncheckedIndexedAccess: true`
- **No `any`** — use `unknown` with type guards
- **Zod for ALL external data** — API inputs, env vars, config
- **Functional patterns** — prefer pure functions, immutability
- **Error handling** — Result pattern or typed errors, never swallow errors
- **Test coverage** — minimum 80% for business logic
- **Naming** — camelCase functions/vars, PascalCase types/components, UPPER_SNAKE_CASE constants
- **File naming** — kebab-case for files, PascalCase for components
- **Max file length** — 300 lines, extract if longer
- **Commit format** — Conventional Commits (`feat:`, `fix:`, `chore:`, etc.)

## Version Policy
- Use LTS versions for runtimes (Node.js, PostgreSQL)
- Update dependencies monthly via Renovate/Dependabot
- Follow semver strictly
- Security patches: apply within 48 hours
- Major upgrades: test in staging first, document breaking changes
