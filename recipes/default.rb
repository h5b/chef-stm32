cache_path = Chef::Config[:file_cache_path]
configure_flags = node[:oocd][:configure_flags].join(" ")

apt_repository "gcc-arm-embedded" do
  uri "http://ppa.launchpad.net/terry.guo/gcc-arm-embedded/ubuntu/"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "6D1D8367A3421AFB"
  action :add
end

node['stm32']['packages'].each do |p|
  package p
end

remote_file File.join(cache_path, "openocd-#{node[:oocd][:version]}.tar.gz") do
  source "#{node[:oocd][:mirror]}#{node[:oocd][:version]}/openocd-#{node[:oocd][:version]}.tar.gz"
  notifies :run, "bash[install_openocd]", :immediately
end

bash "install_openocd" do
  user "root"
  cwd cache_path
  code <<-EOH
    tar xfz openocd-#{node[:oocd][:version]}.tar.gz
    cd openocd-#{node[:oocd][:version]}
    ./configure #{configure_flags}
    make && make install
    EOH
end
