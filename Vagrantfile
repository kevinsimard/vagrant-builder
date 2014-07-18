require "yaml"
VAGRANTFILE_API_VERSION = "2"
options = YAML.load_file("options.yml")
machines = YAML.load_file("machines.yml")

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = options["box"]

    machines.each do |machine|
        config.vm.define machine["hostname"] do |config|
            config.vm.hostname = machine["hostname"]
            config.vm.network :private_network, ip: machine["ip"]

            config.vm.provider :virtualbox do |vb|
                vb.name = machine["hostname"]
                vb.cpus = machine["cpus"]
                vb.memory = machine["memory"]
            end

            config.vm.provision :shell, :path => File.join("provisions", "pre.sh")

            machine["provisions"].each do |provision|
                if File.exists?(File.join("provisions", "#{provision}.sh")) then
                    config.vm.provision :shell, :path => File.join("provisions", "#{provision}.sh")
                end
            end

            config.vm.provision :shell, :path => File.join("provisions", "post.sh")
        end
    end
end
