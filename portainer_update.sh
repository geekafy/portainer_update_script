#!/usr/bin/env bash
# ------------------------------------------------------------------
# [Author] Matthew Bernier (@ggkafy)
# [Description] My shell script to update Portainer on server
# [Version] 1.0
# [Repo Location] https://github.com/geekafy/portainer_update_script.git
# ------------------------------------------------------------------

sudo apt-get update -y
sudo apt-get upgrade -y
docker stop portainer
docker rm portainer
docker pull portainer/portainer-ce:latest
docker run -d -p 8000:8000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
clr
printf "Portainer updated\n"
