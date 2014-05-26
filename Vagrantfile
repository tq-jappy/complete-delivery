# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos"

  config.vm.define :web do |web|
  end

  config.vm.define :chef_server do |chef_server|
    chef_server.vm.synced_folder "share/chef-server", "/share", type: "rsync"
  end

  config.vm.define :app do |app|
  end
end
