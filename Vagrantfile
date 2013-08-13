# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = 'gentoo-amd64-puppet'
  config.vm.box_url = 'http://boxes.alunduil.com/gentoo-amd64-puppet.box'

  config.vm.synced_folder '.', '/var/lib/layman/alunduil-overlay'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = 'site.pp'
    puppet.module_path = 'puppet/modules'
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize [ 'modifyvm', :id, '--memory', 1024 ]
  end
    
  config.vm.define 'holland-default' do |holland|
    holland.vm.hostname = 'holland-default.alunduil.com'
    holland.vm.provision 'shell', inline: 'holland backup'
  end

  config.vm.define 'holland-mysql-lvm' do |holland|
    holland.vm.hostname = 'holland-mysql-lvm.alunduil.com'
    holland.vm.provision 'shell', inline: 'holland backup'
  end
end
