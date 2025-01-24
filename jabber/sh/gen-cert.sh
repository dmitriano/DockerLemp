mkdir temp && \
openssl req -days 1825 -nodes -new -x509 -keyout temp/server.key -out temp/server.cert \
    -subj "/C=US/ST=Delaware/L=New Castle/O=RogaAndK/OU=K-department/CN=developernote.com" && \
cat temp/server.key > etc/ejabberd/ejabberd.pem && \
cat temp/server.cert >> etc/ejabberd/ejabberd.pem && \
rm -fr temp

