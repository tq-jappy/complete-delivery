# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos"

  config.vm.define :chef_server do |chef_server|
    chef_server.vm.hostname = "chef-server"
    chef_server.vm.network "private_network", ip: "192.168.33.10"
    chef_server.vm.synced_folder "share/chef-server", "/share", type: "rsync"

    chef_server.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "chef-repo/site-cookbooks"
      chef.run_list = "recipe[chef-server]"
    end
  end

  config.vm.define :web do |web|
    web.vm.hostname = "web"
    web.vm.network :private_network, ip: "192.168.33.20"
  end


  config.vm.define :app do |app|
    # TODO
  end
end
