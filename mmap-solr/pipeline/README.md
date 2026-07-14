# update_mmap.sh pipeline

Nightly job (run from EC2, orchestrated by `../update_mmap.sh`) that:

1. Builds photo derivatives (thumbnails) from originals.
2. Loads new tablet GIS survey CSVs into the Postgres `tblSite` table.
3. Reloads the `mmap-artifacts` Solr core from Postgres.
4. Reloads the `mmap-sites` Solr core from Postgres + the derivative photos.
5. Regenerates the Site Catalog (`site_report.html`) from the `mmap-sites` data.

All scripts here assume they're invoked with the working directory set to
`mmap-solr/` (the parent of this directory) — that's what `update_mmap.sh`
does, and it's also how outputs (`mmap-sites.csv`, `site_report.html`,
`solr_data/`, etc.) end up at the `mmap-solr/` top level. If you run a step
by hand, `cd` to `mmap-solr/` first and invoke it as `./pipeline/<script>`.

## Requirements

- `CONNECT_STRING` env var: a Postgres connection string, e.g.
  `postgresql://user:pass@host:5432/mmap`
- Solr running on `localhost:8983` with cores `mmap-public` (artifacts) and
  `mmap-sites`
- `psql`, `perl`, `curl`, ImageMagick (`convert`/`magick`), `python3` with
  `psycopg` (v3, or `psycopg2` as a fallback)
- The Postgres view `sites_for_report` must already exist — see
  `sites_for_report_view.sql` for its definition (this doesn't get run
  automatically; it documents what the view should look like when it needs
  to be recreated after a schema change)

## Steps, in pipeline order

| Step | Script | Notes |
|---|---|---|
| 1 | `build_derivatives.sh` | `./pipeline/build_derivatives.sh ORIGINAL_DIR DERIVATIVES_DIR`. `--clean`, `--size`, `--quality`, `--dry-run` supported. |
| 2 | `load_tablet_gis.sh` | `./pipeline/load_tablet_gis.sh csvtoload.csv "$CONNECT_STRING" pipeline/tablet_to_postgres_columns.csv`. Wraps `csv_to_postgres.py`, dedupes on `Site_Name`. |
| 3 | `reload_artifacts_core.sh` | `./pipeline/reload_artifacts_core.sh mmap`. Reads `sql-generator/solr_sql/*.sql` (see `../sql-generator/README.md` for how those are generated/maintained). |
| 4 | `reload_sites_core.sh` | `./pipeline/reload_sites_core.sh DERIVATIVES_DIR`. Queries `sites_for_report`, walks the derivatives tree, merges with `merge_sites_and_photos.py`, loads via `load_sites_into_solr.sh`. |
| 5 | `generate_site_catalog.py` | `python pipeline/generate_site_catalog.py mmap-sites.csv <local\|aws>`. `local` points image URLs at `localhost:3002`; `aws` points at the production image host. |

## Running components locally (surrogates)

You don't need the full EC2 box to exercise most of this:

- `build_derivatives.sh` just needs a local `originals/` tree and ImageMagick.
- `reload_sites_core.sh` / `reload_artifacts_core.sh` need `CONNECT_STRING`
  pointed at a reachable Postgres (a tunnel or local copy) and a local Solr.
- `../ops/sync_from_ec2.sh` pulls the built derivatives tree and the last
  `mmap-sites.csv` down from the EC2 box for local testing without rerunning
  the whole pipeline.

## Superseded docs

The original operational notes this README consolidates are kept, unedited,
in `../other/db-migration-notes/*.orig` for reference.
