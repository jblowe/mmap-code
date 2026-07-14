### mmap-solr

Maintains two things for MMAP:

1. **The Site Catalog** — `site_report.html`, a standalone HTML report of
   every site with photos and metadata.
2. **Two Solr cores** — `mmap-artifacts` (artifact records) and `mmap-sites`
   (site records + photos), which back the MMAP search site.

Both are produced by the nightly `update_mmap.sh` pipeline, which runs on the
EC2 server. A second pipeline (not in this repo) handles a related but
separate process.

#### Layout

- **`update_mmap.sh`** — the orchestrator; run this (or its individual
  steps) to do the actual work.
- **`pipeline/`** — every script `update_mmap.sh` calls, in pipeline order.
  Start with [`pipeline/README.md`](pipeline/README.md).
- **`sql-generator/`** — maintenance tooling for the per-subtable SQL that
  `pipeline/reload_artifacts_core.sh` reads. Not run nightly; run by hand
  when the artifact schema changes. See
  [`sql-generator/README.md`](sql-generator/README.md) — it also documents
  a known incompleteness in how that SQL is generated.
- **`ops/`** — operational scripts/notes for the EC2 box and for pulling
  data down to a laptop for local testing.
- **`other/`** — everything in this directory that *isn't* part of the
  above two functions: side experiments, superseded scripts, one-time
  migration notes, and reference snapshots. Nothing in here is deleted,
  just parked. See [`other/NOTES.md`](other/NOTES.md).

#### Generated files

`mmap-sites.csv`, `mmap-sites.fields.txt`, `site_report.html`,
`files-to-convert*.txt`, and `solr_data/` are pipeline outputs, not source —
see `.gitignore`. (`mmap-sites.fields.txt` is currently still tracked in git
from before this reorg; worth a deliberate `git rm --cached` at some point,
not done here.)
