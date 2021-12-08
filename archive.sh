#! /bin/sh
current_date=$(date +"%Y-%m-%d")

if [ -d "/srv/hostseq/data/archived_data/$current_date" ]
then
        echo "Scripts have already been executed today, VCFs will be overwritten"
else
        mkdir /srv/hostseq/data/archived_data/$current_date
fi

cp /srv/hostseq/data/public.vcf.gz /srv/hostseq/data/archived_data/$current_date
cp /srv/hostseq/data/public.vcf.gz.tbi /srv/hostseq/data/archived_data/$current_date
