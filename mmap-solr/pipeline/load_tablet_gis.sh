python pipeline/csv_to_postgres.py \
  "$1" \
  '"public"."tblSite"' \
  "$2" \
  "$3" \
  --null-blank \
  --dedupe-skip \
  --dedupe-cols "Site_Name"

