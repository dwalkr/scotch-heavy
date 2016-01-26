# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.10.10"
    config.vm.hostname = "scotchbox"
    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]
	config.vm.synced_folder ".", "/vagrant", disabled: true
	config.vm.box_download_insecure = true

    config.vm.provision :shell, path: "bootstrap.sh"

    config.trigger.after [:up, :reload] do
        run_remote "bash /var/www/startup.sh"
    end

end
