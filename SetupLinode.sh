#!/bin/bash
auditctl -e 0
dnf -y upgrade

set -x
XYZ=$(expect -c "
spawn ssh-keygen -b 2048 -t rsa -f /tmp/sshkey -q
expect \"Enter passphrase (empty for no passphrase):\"
send \"\r\"
expect \"Enter same passphrase again:\"
send \"\r\"
")

dnf -y install java-1.8.0-openjdk 
//Alteratives
dnf -y install git
dnf -y install maven
dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
systemctl enable docker
systemctl start docker
