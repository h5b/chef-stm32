cache_path = Chef::Config[:file_cache_path]
configure_flags = node[:openocd][:configure_flags].join(" ")

node['stm32']['packages'].each do |p|
  package p
end

remote_file File.join(cache_path, "openocd-#{node[:openocd][:version]}.tar.gz") do
  source "#{node[:openocd][:mirror]}#{node[:openocd][:version]}/openocd-#{node[:openocd][:version]}.tar.gz"
  notifies :run, "bash[install_openocd]", :immediately
end

bash "install_openocd" do
  user "root"
  cwd cache_path
  code <<-EOH
    tar xfz openocd-#{node[:openocd][:version]}.tar.gz
    cd openocd-#{node[:openocd][:version]}
    ./configure #{configure_flags}
    make && make install
    EOH
end
