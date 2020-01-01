mkdir -p dist/
cp _redirects index.html dist/
echo DEPLOYING TO GOOGLE CLOUD

echo $BASE64GOOGLETOKEN | base64 -d > /tmp/key.json
curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-274.0.1-linux-x86_64.tar.gz > /tmp/gcloud.tar.gz
(cd /tmp && tar zxf gcloud.tar.gz)
/tmp/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file=/tmp/key.json --project=cncf-svg-autocrop
alias gcloud=/tmp/google-cloud-sdk/bin/gcloud
bash deploy.sh
