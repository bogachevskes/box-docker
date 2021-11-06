# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
	config.vm.box = "centos/7"
	config.vm.network :forwarded_port, guest: 83, host: 8300
	config.vm.network :private_network, ip: "192.168.10.172"
	config.vm.network :public_network
	config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
	config.vm.hostname = "docker-host"

	config.vm.provider "virtualbox" do |vb|
		vb.memory = "2024"
		vb.cpus = 2
	end
	
	config.vm.provision :shell, :path => "install.sh"
end