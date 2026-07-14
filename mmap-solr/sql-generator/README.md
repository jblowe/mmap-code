# mmap-artifacts SQL generator

This is *not* run by `update_mmap.sh`. It's the tooling that keeps
`solr_sql/*.sql` up to date — the one-SELECT-per-subtable queries that
`pipeline/reload_artifacts_core.sh` reads directly when it refreshes the
mmap-artifacts Solr core.

1. `generate_artifact_subtable_sql.py` (was `crosswalk.py`) connects to Postgres,
   looks up the columns on each subtable in `joined_tables`, and writes one
   `SELECT am.*, ... FROM "tblArtifact_Master" am JOIN "<subtable>" ...` query
   per table into `solr_sql/`.
2. `pipeline/reload_artifacts_core.sh` reads `sql-generator/solr_sql/${table}.sql`
   directly for each table listed in `pipeline/artifact_subtables.sh` — there is
   no separate "fetch" step anymore. (An older intermediate step,
   `get_tables.sh`, is no longer wired into the pipeline; it's parked in
   `../other/possibly-superseded/`.)

`solr_sql/` is checked into the repo rather than treated as a build artifact,
because it isn't cleanly reproducible from this generator alone right now:
- `tblArtifact_Master.sql` and `"BC Artifact Inventory.sql"` aren't produced
  by `generate_artifact_subtable_sql.py` at all.
- The table list here doesn't match `pipeline/artifact_subtables.sh` 1:1 —
  see the note below.

You'll need `CONNECT_STRING` set (or edit the hardcoded connection block at
the top of the generator) before running it.

```bash
# regenerate the per-subtable SQL (writes into solr_sql/, run from this directory)
python generate_artifact_subtable_sql.py

# reindex mmap-artifacts (run from the mmap-solr/ top level)
CONNECT_STRING="postgresql://..." ../pipeline/reload_artifacts_core.sh mmap
```

## Known incompleteness (flagged, not yet resolved)

- `../other/possibly-superseded/extract-mmap.sql` (a single big joined-query
  alternative to the per-table approach) references subtables that appear in
  neither `pipeline/artifact_subtables.sh` nor `solr_sql/`:
  `tblStoneADZE_BCorig`, `tblStoneAdzesMMAPorig`, `tblStone_CoresOld`,
  `tblelemental-Cu`.
- `add_artifact_subtable_indexes.sql` (was `add_index.sql`) indexes
  `"BC Artifact Inventory"` and 40 `tblX` tables on `MMAP_Artifact_ID`, but
  that table list doesn't exactly match `pipeline/artifact_subtables.sh` either.

These mismatches predate this reorganization — flagging them here rather than
guessing at a fix.
