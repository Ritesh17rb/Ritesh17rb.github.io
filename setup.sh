#!/bin/bash

# Exit on error
set -e

# Generate content/ from posts/, pages/ and metadata.yml
uv run scripts/build_content.py

# Build the static site to public/blog/
hugo

# Add nofollow to comment links
uv run scripts/postprocess_comments_nofollow.py

# Normalize feed URLs
uv run scripts/postprocess_feed_paths.py public/blog

# Copy the home page (pages/ritesh.md) to the site root
cp public/blog/ritesh/index.html public/

