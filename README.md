# homebrew-zerobrew

Homebrew tap for [zerobrew](https://github.com/lucasgelfond/zerobrew).

```bash
brew install cachebag/zerobrew/zerobrew
```

Installs the prebuilt `zb` and `zbx` binaries from zerobrew's GitHub releases, for macOS and Linux on arm64 and x86_64. Run `zb init` afterwards to set up zerobrew.

## Updates

A scheduled workflow checks for a new zerobrew release every 6 hours and updates the formula once it installs and passes its test. To update by hand:

```bash
gh release download v<version> --repo lucasgelfond/zerobrew --pattern SHA256SUMS
bin/update-formula <version> SHA256SUMS
```

## Moving from the old tap

If you installed from `lucasgelfond/zerobrew`, which is no longer updated:

```bash
brew uninstall zerobrew
brew untap lucasgelfond/zerobrew
brew install cachebag/zerobrew/zerobrew
```
