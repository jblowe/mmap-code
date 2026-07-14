
### being some reminders about how to set up mmap solr cores and images on ec2
```
cd ../mmap-code/mmap-solr/
export CONNECT_STRING='postgresql://...'
rm -f nohup.out ;  nohup ./pipeline/reload_artifacts_core.sh mmap &
```
### get rid of hidden files from derivatives directory
```
rm /mnt/images/LaosPhotos/derivatives/.*
rm /mnt/images/LaosPhotos/derivatives/*/.*
rm /mnt/images/LaosPhotos/derivatives/*/*/.*
rm /mnt/images/LaosPhotos/derivatives/*/*/*/.*

rm -rf nohup.out; nohup  ./pipeline/reload_sites_core.sh &
# vi other/possibly-superseded/makesolrcores.sh
```
### we have to delete and recreate the mmap-sites core by hand, for now
```
export SOLR_CMD=/snap/solr/1/bin/solr
sudo $SOLR_CMD delete -c mmap-sites
sudo $SOLR_CMD create -c mmap-sites
```
### vi mmap-sites.fields.txt

### remake the solr core and reload the sites
```
rm -f nohup.out  ; nohup ./other/possibly-superseded/makesolrcores.sh mmap-sites
rm -f nohup.out  ; nohup ./pipeline/reload_sites_core.sh
```
### make the site report
```
python pipeline/generate_site_catalog.py mmap-sites.csv aws > /var/www/html/site_report.html
```