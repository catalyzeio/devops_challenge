# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.define "catalyze_devops_challenge", primary: true do |catalyze_devops_challenge|

    catalyze_devops_challenge.vm.box = "ubuntu/trusty64"
    catalyze_devops_challenge.vm.box_check_update = false

    catalyze_devops_challenge.vm.hostname = "catalyze.local"
    catalyze_devops_challenge.vm.network "private_network", ip: "192.168.33.10"

    catalyze_devops_challenge.vm.synced_folder "salt", "/srv/salt"
    catalyze_devops_challenge.vm.synced_folder "pillar", "/srv/pillar"

    catalyze_devops_challenge.vm.provision :salt do |salt|
      salt.install_master = true
      salt.run_highstate = false
      salt.master_config = "master"
      salt.minion_config = "minion"
      salt.bootstrap_options = "-P"
    end
  end

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = "1"
  end

end
