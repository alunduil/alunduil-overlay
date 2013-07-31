# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "gentoo-amd64-salt"
  config.vm.box_url = "http://boxes.alunduil.com/gentoo-amd64-salt.box"

  config.vm.define "holland" do |holland|
    holland.vm.hostname = "holland.alunduil.com"
    holland.vm.synced_folder ".", "/var/lib/layman/alunduil-overlay"

    holland.vm.provision "shell", inline: "echo app-backup/holland ~amd64 >> /etc/portage/package.accept_keywords"
    holland.vm.provision "shell", inline: "ACCEPT_KEYWORDS=~amd64 emerge -v app-backup/holland"
  end
end
