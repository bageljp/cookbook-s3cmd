default['s3cmd']['install_flavor'] = "src"
default['s3cmd']['version'] = "1.5.0-beta1"
# source
default['s3cmd']['src']['file'] = "v#{node['s3cmd']['version']}.tar.gz"
default['s3cmd']['src']['url'] = "https://github.com/s3tools/s3cmd/archive/#{node['s3cmd']['src']['file']}"
# rpm
default['s3cmd']['rpm']['file'] = "s3cmd-#{node['s3cmd']['version']}-1.x86_64.rpm"
default['s3cmd']['rpm']['url'] = "https://localhost/#{node['s3cmd']['rpm']['file']}"
