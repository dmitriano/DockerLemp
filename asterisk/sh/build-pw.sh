export NEO_PASSWORD=$(pwgen 10 1)
export MORPHEUS_PASSWORD=$(pwgen 10 1)
export RABBIT_PASSWORD=$(pwgen 10 1)

echo neo/$NEO_PASSWORD
echo morpheus/$MORPHEUS_PASSWORD
echo rabbit/$RABBIT_PASSWORD

sudo docker build -t u24asterisk --build-arg NEO_PASSWORD=$NEO_PASSWORD --build-arg MORPHEUS_PASSWORD=$MORPHEUS_PASSWORD --build-arg RABBIT_PASSWORD=$RABBIT_PASSWORD .
