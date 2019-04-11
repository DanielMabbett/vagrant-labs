

# Install the prerequisite packages
sudo su
apt-get install yum -y
apt-get -y install build-essential
apt-get -y install pkg-config
apt-get -y install python
apt-get -y install python-dev
apt-get -y install libpam-dev
apt-get -y install libssl-dev

# Download and extract OMI 1.0.8 from The Open Group
mkdir /root/downloads
cd /root/downloads
wget https://collaboration.opengroup.org/omi/documents/30532/omi-1.0.8.tar.gz
tar -xvf omi-1.0.8.tar.gz

# Configure and build the OMI
cd omi-1.0.8/
./configure
make
make install

# Install the powershell DSC Components
apt-get install python
apt-get install python-devel
cd /root/downloads
wget https://github.com/MSFTOSSMgmt/WPSDSCLinux/releases/download/v1.0.0-CTP/PSDSCLinux.tar.gz
tar -xvf PSDSCLinux.tar.gz
mv ./dsc/* ./
ls -l
make
make reg

# Run OMI server -debugging
OMI_HOME=/opt/omi-1.0.8 /opt/omi-1.0.8/bin/omiserver

# Run OMI server - background
OMI_HOME=/opt/omi-1.0.8 /opt/omi-1.0.8/bin/omiserver -d