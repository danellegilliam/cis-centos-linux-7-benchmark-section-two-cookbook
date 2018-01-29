#
# Cookbook:: cis-centos-linux-7-benchmark-section-two
# Recipe:: 2.1.2
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

service 'xinetd' do
  action :disable
end
