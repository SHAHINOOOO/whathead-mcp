# Platforms & coverage

Whathead exposes **20+ integrations**. The six flagship ad platforms have deep, near-complete
native API coverage; the rest cover campaign management, analytics, attribution, e-commerce,
CRM, and server-side conversions.

## Native ad platforms (deep coverage)

Each of these has a **generic dispatcher** tool that can reach every documented endpoint of
the platform's real API, plus a curated set of **core** operations exposed as first-class
tools, plus **preflight** validators that check a launch before it goes live.

| Platform | API | Native endpoints | Highlights |
|---|---|---:|---|
| **Meta** (Facebook + Instagram) | Graph Marketing API | **528** | Full campaign/ad-set/ad/creative tree, ODAX objectives, catalog/DPA, lead forms, Insights + async reports |
| **TikTok** | Business API v1.3 | **377** | Campaigns, Smart+, GMV Max, DMP audiences, catalog, Spark Ads, reporting |
| **Snapchat** | Marketing API | **312** | Campaigns, ad squads, creatives, dynamic ads, lead gen, CAPI, reporting |
| **Amazon Ads** | Sponsored Products/Brands/Display + Ads API v1 | **184** | SP/SB/SD campaigns, product ads, targeting, async reporting v3 |
| **Apple Search Ads** | Campaign Management API v5 | **73** | Campaigns, ad groups, creatives, targeting/negative keywords, custom reports |
| **Google Ads** | Google Ads API (GAQL) | — | Search/Display/Video/Shopping/PMax/Demand Gen, keywords, assets, GAQL |

> Total native endpoints across Meta/TikTok/Snapchat/Amazon/Apple: **~1,474**. To keep your
> tool list readable, only the core operations register as standalone tools by default; the
> long tail is reachable via each platform's `*_native_action` dispatcher.

## Additional ad platforms

| Platform | Coverage |
|---|---|
| **X (Twitter) Ads** | Campaigns, line items, promoted tweets, audiences, targeting catalogs, reporting |
| **LinkedIn Ads** | Campaign groups/campaigns/creatives, rich targeting + forecasting, lead gen, analytics |
| **Reddit Ads** | Campaigns, ad groups, ads, posts, pixels, funding, reporting |
| **Criteo** | Retail Media campaigns, line items, creatives, audiences, catalogs, billing, reporting |
| **Display & Video 360** | Campaigns, insertion orders, line items, creatives, targeting, Bid Manager reporting |

## Analytics, tracking & attribution

| Platform | Coverage |
|---|---|
| **Google Analytics 4** | runReport / batch / realtime / pivot / funnel, audience exports, async report tasks |
| **Google Search Console** | Sites, sitemaps, URL inspection, Search Analytics |
| **Google Business Profile** | Locations, verification, performance, reviews/posts, lodging |
| **Google Tag Manager** | Full v2 CRUD across containers, tags, triggers, variables, versions + audit |
| **Adjust** | Reporting, deep links (TrueLink), campaign API, app automation, ad-spend |
| **Signal (CDP)** | Server-side Conversions API for Meta / Snapchat / TikTok |

## E-commerce & CRM

| Platform | Coverage |
|---|---|
| **WooCommerce** | Products, orders, customers, coupons, sales/analytics reports |
| **Shopify** | Shop, products, orders, collections, inventory, sales breakdowns |
| **Salla** | Products, categories, orders, customers, coupons, brands, settings |
| **Zoho CRM** | Modules, fields, records, upsert, bulk read/write, webhooks — as a Signal lead destination and source |

## Signal — the built-in CDP

Signal closes the loop from ad → conversion → CRM:

- **Server-side CAPI** for Meta, Snapchat, and TikTok with identity hashing and dedup.
- **Lead capture & routing** from Meta/Snapchat/TikTok lead ads and Zoho CRM into a canonical
  leads inbox, then automatic forwarding to conversion APIs and custom audiences.
- **Delivery quality** tracking, validation, retries, and a durable delivery outbox.

## Cross-Platform Transfer

Move a full campaign from one platform to another — Whathead fetches the source tree, maps
entities to the destination's model, migrates media first (resizing to vertical where the
destination requires it), and rebuilds the campaign paused for your review. Supported between
Meta, Snapchat, TikTok, and Google.
