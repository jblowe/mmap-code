### other/

Everything here is unrelated to, or not currently wired into, the
`update_mmap.sh` pipeline or the `sql-generator/` tooling. Nothing was
deleted during the mmap-solr reorg — this is a parking lot, not a trash can.
Review each subdirectory and decide what to keep, delete, or fold back in.

### ⚠️ geocoding-experiments/geocoding.py

Contains a **hardcoded Google Maps API key** in plaintext
(`gmaps = googlemaps.Client(key='AIzaSy...')`). It was already untracked
before this reorg (never committed), so there's no git history to scrub, but
it shouldn't be added to version control as-is. Recommend rotating the key
and/or moving it to an env var before this file goes anywhere near a commit.

### geocoding-experiments/

A side project enriching the Laos site list with Lao-script names and admin
boundaries via OSM Nominatim / Google Geocoding / Google Places — several
iterations (`geocoding.py` → `geocoding2.py`, `geocode_laos_google.py`,
`google_reverse_geocode_laos_v2.py`, `places_laos_google.py` →
`places_laos_google_v2.py`, `enrich_laos_sites_v2.py`), plus their outputs
`site_names.csv` / `site_names_in_lao.csv`. Not called by the pipeline.

### blacklight-config-gen/

`generate_controllers.sh`, `solr-fields.py`, `make-config.sh` — generate
Ruby controller/config snippets for the Blacklight app from a Solr field
list. Belongs conceptually to `../../blacklight/`, not this pipeline.

### db-migration-notes/

One-time / occasional DB setup and migration notes: `docker-howto.txt`,
`howto.txt`, `howto-cli.txt`, `howto-latest-autoincrement.txt`,
`columns.csv`, `duplicate_columns.txt`, `extract_sites_short.sql`. Also
holds the original, unedited versions of the operational docs that were
consolidated into `../pipeline/README.md`:
`howto-report.txt.orig`, `howto-derivatives.txt.orig`,
`howto-load-metadata-postgres.txt.orig`.

### possibly-superseded/

Scripts that look like earlier or alternate versions of things now living in
`pipeline/` or `sql-generator/`, or that aren't called by anything anymore.
Flagged for a keep/delete decision rather than removed outright:

- `makesolrcores.sh` — drops/recreates all Solr cores by hand; referenced
  only in `ops/ec2_notes.md` as a manual fallback.
- `solrETL-sites-big.sh` — looks like an earlier version of
  `pipeline/load_sites_into_solr.sh`.
- `md_full_options.sh` — near-duplicate of `pipeline/build_derivatives.sh`
  (uses `magick` instead of `convert`, stricter `set -euo pipefail`,
  no `.tif` special-casing). Worth diffing and merging one direction.
- `get_tables.sh`, `sub_tables.txt` — an older SQL-fetch step for the
  artifacts pipeline; `pipeline/reload_artifacts_core.sh` now runs the
  per-table extracts inline instead of via this script.
- `extract-mmap.sql`, `extract-mmap-artifacts_only.sql`, `big_crosswalk.py` —
  single-big-query alternatives to the per-subtable approach in
  `sql-generator/`. `extract-mmap.sql` references subtables that don't
  appear in `pipeline/artifact_subtables.sh` (see
  `../sql-generator/README.md`).
- `make_thumbs.sh` — an earlier, single-positional-arg version of
  `pipeline/build_derivatives.sh`.
- `report_i18n.py` — a `label_to_field` mapping that looks like a draft
  i18n pass over `pipeline/generate_site_catalog.py`'s copy of the same
  dict; never merged in.
- `capitalize.py` — only ever referenced from a commented-out line in
  `pipeline/reload_artifacts_core.sh`.

### reference-snapshots/

Not consumed by any script; kept for reference:

- `mmap-2026-05-04.csv` — a small (3-row) tablet GIS export sample.
- `mmap-artifacts.fields.txt` — a snapshot of the mmap-artifacts Solr field
  list.
- `mmap-site-photos.header.csv` — retired: this was a one-line static header
  (`THUMBNAIL_ss\tDATE_s\tSITE_s\tTYPE_s\tFILENAME_s`) read by
  `reload_sites.sh`; it's now inlined as a shell variable in
  `pipeline/reload_sites_core.sh`.

### unsorted/

`IMG_5237.JPG` — a photo with no evident connection to anything else in this
directory; looks like an accidental drop. Confirm before deleting.
