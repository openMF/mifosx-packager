echo 'deb http://mifos.sanjosesolutions.in stable main' |
sudo tee /etc/apt/sources.list.d/mifosx.list > /dev/null
sudo apt-key adv --recv-keys --keyserver pgp.mit.edu B6069EA209539BFF
sudo apt-get update
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysql'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysql'
sudo debconf-set-selections <<< 'mifosx mifosx/mysql_root_password password mysql'
sudo debconf-set-selections <<< 'mifosx mifosx/recreate_databases boolean true'
sudo debconf-set-selections <<< 'mifosx mifosx/load_sample_data boolean true'
sudo debconf-set-selections <<< 'mifosx mifosx/cname string demo.openmf.org'
sudo debconf-set-selections <<< 'mifosx mifosx/org_name string Mifos\ Initiative'
sudo debconf-set-selections <<< 'mifosx mifosx/org_unit string People'
sudo debconf-set-selections <<< 'mifosx mifosx/city string Seattle'
sudo debconf-set-selections <<< 'mifosx mifosx/state string Washington'
sudo debconf-set-selections <<< 'mifosx mifosx/country string US'
sudo debconf-set-selections <<< 'mifosx mifosx/recreate_keystore boolean true'
sudo debconf-set-selections <<< 'mifosx mifosx/use_standard_port boolean true'
sudo apt-get install -y --force-yes mifosx
