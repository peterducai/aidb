# PG UBUNTU

sudo apt-get install postgresql postgresql-contrib

sudo -u postgres psql
\password

\q




# PG RHEL/CENTOS
sudo yum install postgresql-server postgresql-contrib
sudo postgresql-setup initdb
sudo systemctl start postgresql
sudo systemctl enable postgresql
sudo -u postgres psql
\password

\q
sudo firewall-cmd --permanent --zone=trusted --add-port=5432/tcp
sudo firewall-cmd --reload
