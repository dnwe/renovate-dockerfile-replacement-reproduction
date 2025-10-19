FROM redis:8.2.1@sha256:5fa2edb1e408fa8235e6db8fab01d1afaaae96c9403ba67b70feceb8661e8621 AS base

FROM scratch

COPY --from=base / /
