# -*- mode: ruby -*-
# vi: set ft=ruby :

# Install vagrant-disksize to allow resizing the vagrant box disk.
unless Vagrant.has_plugin?("vagrant-disksize")
    raise  Vagrant::Errors::VagrantError.new, "vagrant-disksize plugin is missing. Please install it using 'vagrant plugin install vagrant-disksize' and rerun 'vagrant up'"
end



ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  # config.vm.provision "shell", path: "bootstrap.sh"
  
  # Kubernetes Master Server
  config.vm.define "master" do |master|
    master.vm.box = "centos/7"
    master.vm.network "private_network", ip: "192.200.1.1"
    master.vm.hostname = "master"
	master.disksize.size = '50GB'
	master.vm.provision "shell", path: "master_svr.sh"
  end

  # Kubernetes Master1 Server
  config.vm.define "master1" do |master1|
    master1.vm.box = "centos/7"
    master1.vm.network "private_network", ip: "192.200.1.1"
    master1.vm.hostname = "master1"
	master1.disksize.size = '50GB'
	master1.vm.provision "shell", path: "master1_svr.sh"
  end
  
  # Kubernetes loadlancer Server
  config.vm.define "loadbalancer" do |loadbalancer|
    loadbalancer.vm.box = "centos/7"
    loadbalancer.vm.network "private_network", ip: "192.200.2.1"
    loadbalancer.vm.hostname = "loadbalancer"
	loadbalancer.disksize.size = '100GB'
	loadbalancer.vm.provision "shell", path: "load_balancer.sh"
  end
  
  # Kubernetes worker node1 Server
  config.vm.define "node1" do |node1|
    node1.vm.box = "centos/7"
    node1.vm.network "private_network", ip: "192.200.2.2"
    node1.vm.hostname = "node1"
	node1.disksize.size = '100GB'
	node1.vm.provision "shell", path: "worker_node.sh"
	
  end
  
  # Kubernetes woker node2 Server
  config.vm.define "node2" do |node2|
    node2.vm.box = "centos/7"
    node2.vm.network "private_network", ip: "192.200.2.3"
    node2.vm.hostname = "node2"
	node2.disksize.size = '100GB'
	node2.vm.provision "shell", path: "worker_node2.sh"
  end
  
  # Kubernetes dregistry Server
  config.vm.define "dregistry" do |dregistry|
    dregistry.vm.box = "centos/7"
    dregistry.vm.network "private_network", ip: "192.200.2.4"
    dregistry.vm.hostname = "dregistry"
	dregistry.disksize.size = '250GB'
	dregistry.vm.provision "shell", path: "dregistry.sh"
	
	
  end

end
