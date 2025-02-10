mkdir temp && cd temp && \
openssl req -days 1825 -nodes -new -x509 -keyout priv_key.pem -out cert.pem \
    -subj "/C=US/ST=Delaware/L=New Castle/O=RogaAndK/OU=K-department/CN=developernote.com"
# rm -fr temp

