rsync -avz --progress \
  -e "ssh -i ~/Downloads/jblowe.pem" \
  ubuntu@54.71.209.160:/mnt/images/LaosPhotos/derivatives/ \
  ~/image_repos/LaosPhotos/derivatives/

rsync -avz --progress \
  -e "ssh -i ~/Downloads/jblowe.pem" \
  ubuntu@54.71.209.160:/home/ubuntu/mmap-code/mmap-solr/mmap-sites.csv \
  ~/GitHub/mmap-code/mmap-solr/mmap-sites.csv


