sudo docker run -d --restart always --name asterisk --cpus=0.5 -p 5060:5060/udp -p 5060:5060 -p 5061:5061 -p 10000-10099:10000-10099/udp u24asterisk
