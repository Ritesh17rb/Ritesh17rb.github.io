---
title: How this blog works
date: "2026-07-04T11:00:00Z"
categories:
  - tech
  - how-i-do-things
tags:
  - hugo
  - blogging
description: "A quick tour of the tech stack behind this blog: Hugo, PaperMod, Markdown, and GitHub Pages."
keywords: [hugo, papermod, github pages, static site, markdown]
---

This blog is a static site. Here is the full stack:

- **Content**: Markdown files in `posts/yyyy/slug.md` and `pages/slug.md`
- **Generator**: [Hugo](https://gohugo.io/) with the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme
- **Build**: a small Python script generates Hugo content from the Markdown sources, then `hugo` builds the site
- **Hosting**: GitHub Pages, deployed automatically by GitHub Actions on every push

To write a new post, I just add a Markdown file and push. No servers, no databases, no cost.
