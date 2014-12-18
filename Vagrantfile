# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "robin/trusty64"
  config.vm.provision "shell", inline: $shell
end

$shell = <<-CONTENTS
apt-get update
apt-get install -y docker.io
CONTENTS
