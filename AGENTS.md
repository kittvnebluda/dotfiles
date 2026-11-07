# AGENTS.md

Follow Conventional Commits (type(scope): subject).

- Types: feat, fix, chore, docs, refactor
- Scopes: package/area name

Rules:

1. Atomic commits: One logical change per commit; build/pass tests before committing.
2. Isolate changes: Separate mechanical edits (format/rename) and docs/chore from behavioral feat/fix.
3. Selective staging: Always stage specific files (git add <file> or -p); never git add -A.
4. On-demand only: Only commit when explicitly asked; never bundle extra unrequested edits.
