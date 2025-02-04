#sudo docker exec asterisk bash -c "asterisk -rx \"core stop now\""
sudo docker exec asterisk asterisk -rx "core stop now"
sudo docker rm asterisk
