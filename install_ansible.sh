#!/bin/bash
# Paul's script to install Ansible and its basic dependencies 3-5-2015_u0
 
rhel5 () {
mkdir /opt/ansible
echo "installing EPEL repo..."
rpm -ivh http://vlslciweb01.regence.com:8888/Software/NextGen/epel-release-5-4.noarch.rpm
echo "installing Ansible 1.8.x ..."
yum -y --enablerepo="rhel-5-server-optional-rpms" install ansible
mv /etc/ansible/hosts /etc/ansible/orig.hosts
echo "127.0.0.1">>/etc/ansible/hosts
yum -y install sshpass
sed -i 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg
}
 
rhel6 () {
mkdir /opt/ansible
echo "installing EPEL repo..."
rpm -ivh http://vlslciweb01.regence.com:8888/Software/NextGen/epel-release-6-8.noarch.rpm
echo "installing Ansible 1.8.x ..."
yum -y --enablerepo="rhel-6-server-optional-rpms" install ansible
mv /etc/ansible/hosts /etc/ansible/orig.hosts
echo "127.0.0.1">>/etc/ansible/hosts
yum -y install sshpass
sed -i 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg
}
 
rhel7 () {
mkdir /opt/ansible
echo "installing EPEL repo..."
rpm -ivh http://vlslciweb01.regence.com:8888/Software/NextGen/epel-release-7-5.noarch.rpm
echo "installing Ansible 1.8.x ..."
yum -y --enablerepo="rhel-7-server-optional-rpms" install ansible
mv /etc/ansible/hosts /etc/ansible/orig.hosts
echo "127.0.0.1">>/etc/ansible/hosts
yum -y install sshpass
sed -i 's/#host_key_checking = False/host_key_checking = False/g' /etc/ansible/ansible.cfg
}
 
if [ `lsb_release -rs | cut -f1 -d.` = 5 ]; then rhel5; exit; fi
if [ `lsb_release -rs | cut -f1 -d.` = 6 ]; then rhel6; exit; fi
if [ `rpm -qa --queryformat '%{VERSION}\n' '(redhat|sl|slf|centos|oraclelinux)-release(|-server|-workstation|-client|-computenode)'| cut -f1 -d.` = 7 ];
        then rhel7;
        exit
fi

