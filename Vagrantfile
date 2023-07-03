Vagrant.configure("2") do |config|

  config.vm.define "swarm-manager" do |node|
    node.vm.box = "ubuntu/bionic64"
    node.vm.hostname = "swarm-manager"
    node.vm.network "private_network", ip: "192.168.23.10"
    node.vm.provider "virtualbox" do |vb|
      vb.name = "swarm-manager"
      vb.memory = "2048"
      vb.customize ["modifyvm", :id, "--groups", "/CloudComputing"]
    end

    node.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y ansible
      curl -fsSL https://get.docker.com -o get-docker.sh
      sudo sh get-docker.sh
      sudo usermod -aG docker vagrant
    SHELL

    node.vm.synced_folder './SHARED/', '/home/vagrant/SHARED'
  end

  (1..2).each do |i|
    config.vm.define "swarm-worker#{i}" do |node|
      node.vm.box = "ubuntu/bionic64"
      node.vm.hostname = "swarm-worker#{i}"
      node.vm.network "private_network", ip: "192.168.23.#{10 + i}"
      node.vm.provider "virtualbox" do |vb|
        vb.name = "swarm-worker#{i}"
        vb.memory = "1048"
        vb.customize ["modifyvm", :id, "--groups", "/CloudComputing"]
      end

      node.vm.provision "shell", inline: <<-SHELL
        curl -fsSL https://get.docker.com -o get-docker.sh
        sudo sh get-docker.sh
        sudo usermod -aG docker vagrant
      SHELL

      node.vm.synced_folder "./app", "/app", disabled: false
    end
  end

  # config.vm.define "load-balancer" do |node|
  #   node.vm.box = "ubuntu/bionic64"
  #   node.vm.hostname = "load-balancer"
  #   node.vm.network "private_network", ip: "192.168.23.1"
  #   node.vm.provider "virtualbox" do |vb|
  #     vb.name = "load-balancer"
  #     vb.memory = "768"
  #     vb.customize ["modifyvm", :id, "--groups", "/CloudComputing"]
  #   end 

  #   node.vm.provision "shell", inline: <<-SHELL
  #     sudo apt-get update
  #     sudo apt-get install -y ansible
  #   SHELL

  #  # node.vm.provision "shell", privileged: false, inline: <<-SHELL
  #  #   ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
  #  # SHELL

  #   node.vm.synced_folder './SHARED/', '/home/vagrant/SHARED', disabled: false
  # end

end
