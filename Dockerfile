FROM redis:8.4.0@sha256:39debd9bd83500468d5014f4f2b7fb16711c849287d35f66b6d2d9c6b1623972 AS base

FROM scratch

COPY --from=base / /
