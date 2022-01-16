# banyan-template
Template for https://github.com/srid/banyan

## Run locally

```
nix run
```

(Or <kbd>Ctrl+Shift+B</kbd> in Visual Studio Code)

To update to latest version of banyan, run `nix flake lock --update-input banyan`.

## Deploy to GitHub Pages

See `.github/workflows/publish.yml` (and todo below)

## Todo

- Set `<base>` href for github.io domain to work (use CNAME until then)
- flake.nix: don't hardcode system
- Use random port (hardcoded in `flake.nix)
    - Or not: if VSCode leaves banyan running as ghost-process.
      - Always use tmux?
