require "yaml"
VAGRANTFILE_API_VERSION = "2"
options = YAML.load_file("options.yml")
machines = YAML.load_file("machines.yml")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    machines.each do |machine|
        config.vm.define machine["hostname"] do |config|
            # configure the box
            config.vm.box = machine["box"] ||= options["box"] ||= "ubuntu/trusty64"
            config.vm.hostname = machine["hostname"]

            # configure a private network IP
            config.vm.network :private_network, ip: machine["ip"]

            # configure VirtualBox settings
            config.vm.provider :virtualbox do |vb|
                vb.customize ["modifyvm", :id, "--name", machine["name"] ||= machine["hostname"] ||= nil]
                vb.customize ["modifyvm", :id, "--cpus", machine["cpus"] ||= "1"]
                vb.customize ["modifyvm", :id, "--memory", machine["memory"] ||= "512"]
                vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            end

            # configure port forwarding
            if machine.has_key?("forwards")
                machine["forwards"].each do |forward|
                    config.vm.network "forwarded_port", guest: forward["guest"], host: forward["host"]
                end
            end

            # configure the shared folders
            if machine.has_key?("folders")
                machine["folders"].each do |folder|
                    config.vm.synced_folder folder["map"], folder["to"], type: folder["type"] ||= nil
                end
            end

            # configure pre provision
            config.vm.provision :shell, :path => "provisions/pre.sh"

            # configure provisions
            if machine.has_key?("provisions")
                machine["provisions"].each do |provision|
                    if File.exists?("provisions/#{provision}.sh") then
                        config.vm.provision :shell, :path => "provisions/#{provision}.sh"
                    end
                end
            end

            # configure post provision
            config.vm.provision :shell, :path => "provisions/post.sh"
        end
    end
end
