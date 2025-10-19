# Renovate Digest Replacement Bug Reproduction

This repository reproduces the digest concatenation bug when using `replacementNameTemplate` with `replace` directive in Dockerfiles.

## Bug Description

When using `replacementNameTemplate` package rules with the `replace` directive in Dockerfiles, if the image already has a pinned digest Renovate corrupts the replacement digest by concatenating the entire digest value, resulting in `sha256:sha256:HASHHASH` instead of `sha256:HASH`.

## Files

- `renovate.json`: Renovate configuration with an example replacement template
- `Dockerfile`: a Dockerfile with digest-pinned redis image

## Expected Behavior

Renovate should create a replacement branch with:

```dockerfile
FROM docker.io/library/redis:8.2.1@sha256:5fa2edb1e408fa8235e6db8fab01d1afaaae96c9403ba67b70feceb8661e8621 AS base
```

## Actual Behavior

Renovate fails with digest corruption, doubling the digest to:

```
sha256:sha256:5fa2edb1e408fa8235e6db8fab01d1afaaae96c9403ba67b70feceb8661e86211e408fa8235e6db8fab01d1afaaae96c9403ba67b70feceb8661e8621
```

## Reference

See: https://github.com/renovatebot/renovate/discussions/38703
