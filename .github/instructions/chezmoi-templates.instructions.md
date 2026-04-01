---
applyTo: "**/*.tmpl"
---

These are [chezmoi](https://www.chezmoi.io/) Go template files. They are processed by chezmoi before being written to the target location.

## Template Syntax

Use standard Go `text/template` syntax. chezmoi provides additional functions from [sprig](http://masterminds.github.io/sprig/) and its own helpers.

## Common Variables

- `{{ .chezmoi.hostname }}` — machine hostname
- `{{ .chezmoi.username }}` — current user
- `{{ .chezmoi.os }}` — operating system (`darwin`, `linux`, etc.)

## Template Data

Values from `.chezmoidata/packages.yml` are available directly:
- `{{ .packages.darwin.brews }}` — list of Homebrew formulae
- `{{ .packages.darwin.casks }}` — list of Homebrew casks
- `{{ .packages.darwin.taps }}` — list of Homebrew taps

## Work vs Personal Machine

Work machines have hostnames prefixed with `LIBP`. Use this pattern to conditionally apply settings:

```
{{ if hasPrefix "LIBP" .chezmoi.hostname }}
# work-only config
{{ end }}
```

## Triggering Scripts on File Changes

To make a `run_onchange_` script re-run when another file changes, embed its hash in a comment:

```sh
# {{ include "dot_zshrc.tmpl" | sha256sum }}
```
