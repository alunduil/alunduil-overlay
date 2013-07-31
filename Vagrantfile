# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "gentoo-amd64-salt"
  config.vm.box_url = "http://boxes.alunduil.com/gentoo-amd64-salt.box"

  config.vm.synced_folder ".", "/var/lib/layman/alunduil-overlay"

  config.vm.synced_folder "salt/roots/", "/srv/salt"

  config.vm.provision :salt do |salt|
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize [ "modifyvm", :id, "--memory", 1024 ]
  end
    
  config.vm.define "holland-default" do |holland|
    holland.vm.hostname = "holland-default.alunduil.com"
    holland.vm.provision "shell", inline: "holland backup"
  end
end
