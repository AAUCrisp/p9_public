mkdir -p media/dash
wget -O file.zip "https://gitlab.com/stepski011/streaming-analytics-cmcd-cmsd/-/archive/master/streaming-analytics-cmcd-cmsd-master.zip?path=cmcd-server/nginx/media" && unzip file.zip

# Fish out media files (GitLab returns zip with whole repo structure, not just media url)
mv ./streaming-analytics-cmcd-cmsd-master-cmcd-server-nginx-media/cmcd-server/nginx/media/vod/* ./media/dash/

# Clean up
rm -rf ./file.zip ./streaming-analytics-cmcd-cmsd-master-cmcd-server-nginx-media
