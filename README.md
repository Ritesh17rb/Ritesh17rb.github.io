# Ritesh's Blog

Content and build pipeline for my blog. Based on the structure of
[sanand0/blog](https://github.com/sanand0/blog) (Hugo + PaperMod).

## Source files

Content:

- `pages/`: Standalone pages as Markdown (`pages/slug.md`). Pages can be nested: `pages/lists/slug.md`.
  - [Home page](pages/ritesh.md) — copied to the site root by `setup.sh`.
- `posts/`: Blog posts as Markdown (`posts/yyyy/slug.md`).
- `assets/`: Media files used by posts (prefer WebP/OPUS). Served at `/blog/assets/`.

Configuration & code:

- `metadata.yml`: taxonomies (categories, tags) and author info
- `hugo.toml`: Hugo site configuration
- `setup.sh`: build script — generates content and builds the site
- `.github/workflows/deploy.yml`: GitHub Pages deployment workflow
- `layouts/`: Hugo layout overrides for theme customizations
- `static/`: static files (CSS overrides, JS)
- `themes/PaperMod/`: Hugo theme sources (vendored)
- `scripts/`: build and post-processing scripts

Auto-generated (DO NOT edit!):

- `content/`: Hugo content generated from `posts/`, `pages/` and `metadata.yml`
- `public/`: build output (deployed to GitHub Pages)

## Build locally

Requires [Hugo](https://gohugo.io/) and [uv](https://docs.astral.sh/uv/) on PATH.

```bash
bash setup.sh          # full build to public/
hugo server            # live-reload dev server at http://localhost:1313/blog/
```

Note: `hugo server` serves generated `content/` — re-run `uv run scripts/build_content.py`
after adding or editing files in `posts/` or `pages/`.

## Writing a post

Create `posts/yyyy/my-post-slug.md`:

```markdown
---
title: My post title
date: "2026-07-04T10:00:00Z"
categories:
  - tech
tags:
  - hugo
description: One-line summary for meta description.
keywords: [a, few, keywords]
---

Post body in Markdown.
```

The file name becomes the URL: `/blog/my-post-slug/`. Posts dated in the
future are not published until that time passes.

## Deploy to GitHub Pages

1. Create a GitHub repo named **`Ritesh17rb.github.io`** and push this to its
   `main` branch. The repo name matters: internal links use absolute
   `/blog/...` paths, so the site must be served from a domain root — which a
   GitHub Pages *user site* (`<username>.github.io`) provides. (A custom
   domain via a `CNAME` file also works.)
2. In the repo: Settings → Pages → Source → **GitHub Actions**.
3. Push. The workflow in `.github/workflows/deploy.yml` builds and deploys
   automatically. The blog appears at <https://ritesh17rb.github.io/blog/>,
   with the home page at <https://ritesh17rb.github.io/>.

Commits whose message contains `[skip ci]` do not trigger a deploy.

## Frontmatter reference

Required: `title`. Recommended: `date` (ISO 8601), `description`, `keywords`.

Optional:

- `classes: wrap-code` wraps long code blocks in the post.
- `build: { list: never, render: always }` renders a page without listing it in any index.
- `robotsNoIndex: true` adds `<meta name="robots" content="noindex">`.
- `aliases: ["old-path"]` redirects old URLs to this page.
