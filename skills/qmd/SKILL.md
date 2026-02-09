---
name: qmd
description: Search indexed markdown documents using QMD (hybrid BM25 + vector + reranking). Use for finding relevant docs, memory, or skill info without loading full files.
metadata:
  {
    "openclaw":
      {
        "emoji": "🔍",
        "os": ["darwin", "linux"],
        "requires": { "bins": ["qmd"] },
      },
  }
---

# QMD - Query Markdown Documents

Use `qmd` to search your indexed knowledge bases instead of loading entire files into context.

## When to Use

- Finding relevant documentation before answering questions
- Searching memory files for past conversations/decisions
- Looking up skill instructions
- Any time you need information from markdown files

## Collections Available

- `workspace` - MantisClaw's workspace (memory, config, identity)
- `docs` - Mantis/OpenClaw documentation  
- `skills` - Agent skill definitions and instructions

## Search Commands

```bash
# Fast keyword search (BM25)
qmd search "query terms" -n 5

# Semantic search (requires embeddings)
qmd vsearch "natural language question" -n 5

# Hybrid search with reranking (best quality, slower)
qmd query "complex question" -n 5

# Search specific collection
qmd search "query" -c workspace

# Get JSON output for processing
qmd search "query" --json -n 10

# Get full document content
qmd get "docs/cli/gateway.md"

# Get document by docid from search results
qmd get "#abc123"
```

## Options

- `-n <num>` - Number of results (default: 5)
- `-c, --collection <name>` - Filter to specific collection
- `--json` - JSON output
- `--full` - Show full document content
- `--min-score <num>` - Minimum relevance score (0-1)

## Workflow

1. Search for relevant documents first
2. Use `qmd get` to retrieve specific sections you need
3. Only load what's necessary into context

## Index Maintenance

```bash
# Check status
qmd status

# Re-index after file changes
qmd update

# Generate/update embeddings
qmd embed
```

## Notes

- BM25 search works immediately
- Vector/semantic search requires embeddings (`qmd embed`)
- Hybrid `query` command provides best results but is slower
- Use `--json` output when you need structured data
