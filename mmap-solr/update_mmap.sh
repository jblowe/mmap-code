#!/bin/bash -x
#
# nightly update of mmap resources
#
PHOTO_DIR=/mnt/images/LaosPhotos
source /home/ubuntu/.profile
cd /home/ubuntu/mmap-code/mmap-solr/

# update derivatives
time ./pipeline/build_derivatives.sh ${PHOTO_DIR}/originals ${PHOTO_DIR}/derivatives >> mmap-derivatives.txt 2>&1

# concatenate all tablet GIS files together and process into postgres
cat /mnt/images/MMAP_GIS_data/* > csvtoload.csv
time ./pipeline/load_tablet_gis.sh csvtoload.csv "$CONNECT_STRING" pipeline/tablet_to_postgres_columns.csv >> mmap-loadpostgres.txt 2>&1

# reload artifacts solr core
time ./pipeline/reload_artifacts_core.sh mmap >> mmap-reload-artifacts.txt 2>&1

# reload sites solr core
time ./pipeline/reload_sites_core.sh ${PHOTO_DIR}/derivatives >> mmap-reload-sites.txt 2>&1

# regenerate site catalog, but leave it in the runtime directory
python pipeline/generate_site_catalog.py mmap-sites.csv aws > site_report.html
