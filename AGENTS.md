# Editing OKRs

- Keep quarterly definitions ordered; use stable names and explicit weekly targets.
- Use YAML with unindented sequences. Weekly files are keyed by theme/objective/KR.
- `target: null` means unspecified, never inherited. Fill it when setting a target.
- Green means healthy weekly progress; completed means the entire KR is finished.
- On completion, remove future targets and progress; only inactive entries may remain.
- Run `make check` after edits (requires Make and Podman; dependencies run in a container).
