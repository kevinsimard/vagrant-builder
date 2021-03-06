require "yaml"
VAGRANTFILE_API_VERSION = "2"
machines = YAML.load_file("machines.yml")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    machines.each do |machine|
        config.vm.define machine["hostname"] do |config|
            # configure box
            config.vm.box = machine["box"] ||= "ubuntu/trusty64"
            config.vm.hostname = machine["hostname"]

            # configure private network ip
            config.vm.network :private_network, ip: machine["ip"]

            # configure VirtualBox settings
            config.vm.provider :virtualbox do |vb|
                vb.customize ["modifyvm", :id, "--name", machine["name"] ||= machine["hostname"]]
                vb.customize ["modifyvm", :id, "--cpus", machine["cpus"] ||= "1"]
                vb.customize ["modifyvm", :id, "--memory", machine["memory"] ||= "1024"]
                vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            end

            # configure port forwarding
            if machine.has_key?("ports")
                machine["ports"].each do |port|
                    config.vm.network "forwarded_port", guest: port["to"], host: port["send"]
                end
            end

            # disable default /vagrant synced folder
            config.vm.synced_folder ".", "/vagrant", disabled: true

            # configure shared folders
            if machine.has_key?("folders")
                machine["folders"].each do |folder|
                    config.vm.synced_folder folder["map"], folder["to"], type: folder["type"] ||= nil,
                        owner: "vagrant", group: "www-data", :mount_options => ["dmode=775", "fmode=664"]
                end
            end

            # configure Swap file
            config.vm.provision :shell, :path => "provisions/scripts/swap.sh",
                :args => [machine["swap"].to_s ||= "2048"]

            # configure pre provision
            config.vm.provision :shell, :path => "provisions/scripts/pre.sh"

            # configure provisions
            if machine.has_key?("provisions")
                provisions = machine["provisions"] ||= []
                provisions.each do |provision, options| args = []
                    if !options.nil?
                        options.each do |key, value|
                            args.push key.to_s, value.to_s
                        end
                    end

                    if File.exists?("provisions/#{provision}.sh")
                        config.vm.provision :shell, :path => "provisions/#{provision}.sh", :args => args
                    end
                end
            end

            # configure post provision
            config.vm.provision :shell, :path => "provisions/scripts/post.sh"
        end
    end
end
