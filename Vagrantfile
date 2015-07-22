# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  #config.vm.box = "Erudit/VM-dev"
  config.vm.hostname = "erudit-vm-dev"
  
  # Config pour Packer
  config.vm.box = "centos 7.0"
  config.vm.box_url = "./centos-7.0.box"

  # Shared/Synced folder
  config.vm.synced_folder "share/", "/mnt/share"

  shared_dir = "/vagrant"

  #Shell script configuration
  #config.vm.provision :shell, path: "scripts/bootstrap.sh", args: shared_dir
  #config.vm.provision :shell, path: "scripts/apache/apache.sh", args: shared_dir
  #config.vm.provision :shell, path: "scripts/java/java.sh", args: shared_dir
  #config.vm.provision :shell, path: "scripts/tomcat/tomcat.sh", args: shared_dir
  #config.vm.provision :shell, path: "scripts/solr/solr.sh", args: shared_dir
  #config.vm.provision :shell, path: "scripts/mariadb/mariadb.sh", args: shared_dir
  #config.vm.provision :shell, path: "scripts/eclipse/eclipse.sh", args: shared_dir
  #config.vm.provision :shell, path: "scripts/fedora/fedora.sh", args: shared_dir
 
  #Ansible configuration script
  config.vm.provision :shell, path: "scripts/ansible/init.sh", args: shared_dir


  #Port mapping and forwarding
  config.vm.network :forwarded_port, host: 4567, guest: 80, auto_correct: true
  config.vm.network :forwarded_port, host: 8080, guest: 8080, auto_correct: true 
  
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.10.150"
   
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
#   config.vm.network "public_network"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:

   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  
   # Customize the amount of memory on the VM:
     vb.memory = "4096"
     vb.cpus = "3"
   end

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # config.vm.post_up_message = "Use: vagrant ssh or login with vagrant / vagrant in the graphical environment."
end
