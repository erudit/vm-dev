# -*- mode: ruby -*-
# vi: set ft=ruby :

#required_plugins = %w(vagrant-share vagrant-vbguest...)
required_plugins = %w( vagrant-vbguest )

plugins_to_install = required_plugins.select { |plugin| not Vagrant.has_plugin? plugin }
if not plugins_to_install.empty?
  puts "Installing plugins: #{plugins_to_install.join(' ')}"
  if system "vagrant plugin install #{plugins_to_install.join(' ')}"
    exec "vagrant #{ARGV.join(' ')}"
  else
    abort "Installation of one or more plugins has failed. Aborting."
  end
end

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

  # Config pour Packer
  config.vm.box = "centos 7.0"
  config.vm.box_url = "./centos7.0.box"

  #config.file.share_folder = "/vagrant" # Default?
  shared_dir = "/vagrant"


  # https://github.com/dotless-de/vagrant-vbguest
  # we will try to autodetect this path. 
  # However, if we cannot or you have a special one you may pass it like:
  # config.vbguest.iso_path = "#{ENV['HOME']}/Downloads/VBoxGuestAdditions.iso"
  # or
  # config.vbguest.iso_path = "http://company.server/VirtualBox/%{version}/VBoxGuestAdditions.iso"

  # set auto_update to false, if you do NOT want to check the correct 
  # additions version when booting this machine
  # config.vbguest.auto_update = false

  # do NOT download the iso file from a webserver
  # config.vbguest.no_remote = true


  config.vm.provision :shell, path: "scripts/bootstrap.sh", args: shared_dir
  config.vm.provision :shell, path: "scripts/apache/apache.sh", args: shared_dir
  config.vm.provision :shell, path: "scripts/java/java.sh", args: shared_dir
  config.vm.provision :shell, path: "scripts/tomcat/tomcat.sh", args: shared_dir
  config.vm.provision :shell, path: "scripts/solr/solr.sh", args: shared_dir
  config.vm.provision :shell, path: "scripts/mariadb/mariadb.sh", args: shared_dir
  config.vm.provision :shell, path: "scripts/eclipse/eclipse.sh", args: shared_dir
  config.vm.provision :shell, path: "scripts/fedora/fedora.sh", args: shared_dir

  #Port redirection if the vm is in Headless Mode
  config.vm.network :forwarded_port, host: 4567, guest: 80, auto_correct: true
  config.vm.network :forwarded_port, host: 8080, guest: 8080, auto_correct: true 
  
  #Change MySQL root password
  config.vm.provision :shell, inline: "mysql -u root -e 'source /vagrant/scripts/mariadb/query.sql'"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network "private_network", ip: "192.168.50.4"
   
  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  
   # Customize the amount of memory on the VM:
     vb.memory = "4096"
     vb.cpus = "3"
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
