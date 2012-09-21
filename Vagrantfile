#TODO: Is there a vagrant plugin for IDEA?

Vagrant::Config.run do |config|
  # If you are unfamiliar with Vagrant, online documentation is at vagrantup.com.

  config.vm.box = "base"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  #config.vm.boot_mode = :gui

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port "http", 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.share_folder "geo-spatial-analytics-project", "/home/vagrant/geo_spatial_analytics", "geo_spatial_analytics"

  config.vm.provision :puppet do |puppet|
   puppet.module_path = "modules"
   puppet.manifests_path = "manifests"
   puppet.manifest_file  = "base.pp"
  end
end
