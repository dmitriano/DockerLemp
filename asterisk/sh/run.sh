sudo docker run -d --restart always --name jabber -v /var/lib/ejabberd:/var/lib/ejabberd -p 5280:5280 -p 5222:5222 -p 5269:5269 -p 7777:7777 u24jabber
