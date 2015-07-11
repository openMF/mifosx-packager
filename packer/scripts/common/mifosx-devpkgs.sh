sudo apt-get update
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password mysql'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password mysql'
sudo apt-get install -y --force-yes mysql-server git \
  eclipse nodejs-legacy npm openjdk-7-jdk gnome
git clone --recursive https://github.com/openMF/mifosx.git
cd mifosx/mifosng-provider
./gradlew -Penv=dev clean cleanEclipse eclipse
./gradlew -Penv=dev clean war
cd ../apps/community-app
git checkout develop
npm config set prefix ~
npm install -g grunt-cli
npm install -g bower
$HOME/bin/bower install --config.interactive=false
npm install
