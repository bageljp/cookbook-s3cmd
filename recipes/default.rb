#
# Cookbook Name:: s3cmd
# Recipe:: default
#
# Copyright 2013, bageljp
#
# All rights reserved - Do Not Redistribute
#

%w(
  pytz
  python-magic
).each do |pkg|
  package pkg do
    action :install
  end
end

case node['s3cmd']['install_flavor']
when 'src'
  # source
  remote_file "/usr/local/src/#{node['s3cmd']['src']['file']}" do
    owner "root"
    group "root"
    mode 00644
    source "#{node['s3cmd']['src']['url']}"
  end

  bash "python setup.py install" do
    user "root"
    group "root"
    cwd "/usr/local/src"
    code <<-EOC
      rm -rf s3cmd-#{node['s3cmd']['version']}
      gzip -dc #{node['s3cmd']['src']['file']} | tar xf -
      cd s3cmd-#{node['s3cmd']['version']}
      python setup.py install
    EOC
    not_if "ls /usr/bin/s3cmd"
  end
when 'rpm'
  # rpm
  remote_file "/usr/local/src/#{node['s3cmd']['rpm']['file']}" do
    owner "root"
    group "root"
    mode 00644
    source "#{node['s3cmd']['rpm']['url']}"
  end

  package "s3cmd" do
    action :install
    provider Chef::Provider::Package::Rpm
    source "/usr/local/src/#{node['s3cmd']['rpm']['file']}"
  end
else
  package "s3cmd" do
    options "--enablerepo=epel"
    action :install
  end
end
