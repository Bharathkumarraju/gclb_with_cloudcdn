#Migrating to Cloud DNS
#Create a managed zone
gcloud dns managed-zones create --dns-name="spikeysales.com." --description="spikeysales-europe-public-zone" "spikeysales-europe-managed-zone"

#Export your DNS configuration from your existing provider
gcloud dns record-sets export spikeysales.zone -z=spikeysales-us-managed-zone \
   --zone-file-format

#Import the record set

gcloud dns record-sets import -z=spikeysales-europe-managed-zone \
  --delete-all-existing \
  --zone-file-format spikeysales.zone

#Verify DNS propagation

Look up your zone Cloud DNS name servers:
gcloud dns managed-zones describe spikeysales-europe-managed-zone


Update your registrar name server records

Delete the spikeysales-us-managed-zone

Hit the spikeysales.com and see that the spikeysales page is accessible or not

#Wait for changes, then verify

dig +short NS spikysales.com

