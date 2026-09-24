# PR Review Instructions

## Grounding rules

- Only flag issues you can cite directly from the diff. If you cannot point to a specific line,
  do not raise the comment.
- If you are unsure whether something is a bug or intentional, say so explicitly rather than
  asserting it is wrong.
- Do not apply general knowledge about Ruby, Homebrew, or GitHub Actions if the diff does not
  contain evidence of a violation. Patterns and invariants are documented in `AGENTS.md`; cite
  that file if you reference a rule.

## Scope

Review only what the PR changes. Do not flag issues in files the PR does not touch.

## Homebrew formulas

- Verify every platform block (macOS ARM, Linux ARM, Linux x86_64) is updated together; a
  version bump must not leave platforms at different versions.
- Verify sha256 values look like plausible digests and match the referenced release URL; a
  mismatched hash breaks `brew install` for every user. Never accept an invented hash.
- Do not comment on style that `brew style` would catch automatically; it is enforced
  locally and in CI.
- Do not suggest structural changes to formulas (adding service blocks, caveats, extra
  resources) without a justification visible in the diff; formulas here are intentionally
  minimal (url/sha256, install, test).

## Workflow files

- Flag `${{ expression }}` interpolation directly inside `run:` scripts; inputs should be
  passed via `env:` blocks.
- Verify action pins use commit SHAs, not mutable tags.
- Check that `permissions:` blocks are present and minimal.

## General

- One comment per distinct issue; do not duplicate findings across multiple inline comments.
- Prefer a suggestion block over describing the problem when the fix is unambiguous.
- If you have no findings, say so. Do not invent issues to appear thorough.
