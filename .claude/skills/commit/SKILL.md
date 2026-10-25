---
name: commit
description: Split the current working-tree changes into multiple well-scoped git commits, grouped by functionality rather than by file. Validates formatting on each group before committing, offers to run the test suite first, and always commits as the human user — never as or with Claude. Use whenever the user says "commit this", "commit these changes", "split this into commits", "group these changes into commits", or similar, especially when `git status`/`git diff` shows changes touching more than one concern.
---

# Commit

Turn a messy working tree into a small stack of clean, single-purpose commits — instead of one
commit that mixes a bugfix with a refactor with a formatting pass.

## Why grouping matters

A commit is a unit of review and of `git bisect`/`git revert`. If it mixes unrelated changes,
both break: a reviewer can't approve half of it, and reverting it takes the good with the bad.
Splitting by *functionality* (what the change does), not by file type or alphabetical order, is
what makes the history actually useful later.

## Steps

1. **See the whole diff first.** Run `git status` and `git diff` (and `git diff --staged` if
   anything is already staged) before touching anything. Never run a destructive git command
   (`checkout`, `restore`, `reset`, `clean`) without having looked at what's there — if this repo
   already has something staged that looks like in-progress work, don't silently fold it into your
   own groups without flagging it.

2. **Propose the grouping, then confirm.** Read through the diff and cluster the changes by what
   they *do* — e.g. "fix null check in parser", "add retry to HTTP client", "rename Foo to Bar",
   "update docs for the new flag". A single logical change can span multiple files; a single file
   can also need to be split across commits if it mixes concerns (use `git add -p` / `git diff`
   hunk selection for that, don't force a whole file into one bucket just because splitting it is
   more work). Show the user the proposed commit list (one line each: message + files/hunks) before
   creating anything. This is the one step worth pausing on — grouping is a judgment call, and it's
   cheap to confirm before you've made several commits you'd have to amend or reorder.

3. **Ask about the test suite once, up front** — before the first commit, not per-commit. Check
   for a project test runner (`ctest`, `npm test`, `pytest`, `cargo test`, a `Makefile` target,
   whatever this repo actually uses) and ask the user whether to run it before committing. If they
   decline or there's no test target, move on — don't block on it.

4. **Validate formatting per group, not globally.** Before committing each group, check the repo
   for its own formatting tooling and use *that* rather than reformatting with a generic tool of
   your choosing:
   - `.pre-commit-config.yaml` present → `pre-commit run --files <files in this group>`
   - A documented format script (e.g. `scripts/run_clang_format.sh`, a `make format` target,
     `npm run format`, `cargo fmt`) → run it scoped to the group's files where the tool supports
     that, otherwise run it and check `git diff` only touched files in this group afterward
   - Nothing project-specific → fall back to the obvious tool for the language present
     (clang-format, black, gofmt, prettier, rustfmt) if it's already installed; don't add a new
     formatting dependency just to satisfy this step
   If formatting changes files, re-stage them as part of the same group before committing — a
   commit whose diff doesn't match its own formatter's output is the thing this step exists to
   prevent.

5. **Stage and commit each group individually**, in an order where earlier commits don't depend on
   later ones breaking the build (e.g. a rename before the feature that uses the new name).

6. **Never commit as, or with, Claude.** This is the one hard rule in this skill and it overrides
   the default commit-message convention:
   - Do **not** add a `Co-Authored-By: Claude ...` trailer.
   - Do **not** let `git config user.*` (if it's set to a Claude identity in this environment)
     leak into the commit. Pass `--author` explicitly instead of relying on ambient git config:

     ```
     git commit --author="Ahmed Hussein <eng.ahmedhussein89@gmail.com>" -m "$(cat <<'EOF'
     <commit message>
     EOF
     )"
     ```
   - Write commit messages in the user's voice — what changed and why — with no mention of Claude,
     this skill, or the fact that an AI wrote the commit.

7. **Verify at the end.** Run `git log --oneline -n <number of commits you made>` and `git status`
   to show the user the resulting stack and confirm the working tree is otherwise clean. If
   anything was left unstaged on purpose (e.g. the user wants to review it separately), say so.

## Notes

- Don't invent a grouping scheme more elaborate than the diff calls for — a two-file bugfix doesn't
  need to be split into three commits just to look thorough.
- If the user has already staged exactly the changes they want in one commit, don't second-guess a
  clear single-purpose staging area; only re-split when the diff genuinely mixes concerns.
- Never `git push` as part of this skill unless the user explicitly asks — grouping and committing
  locally is the job here.
