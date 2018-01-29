#
# Cookbook:: cis-centos-linux-7-benchmark-section-two
# Recipe:: 2.1.6
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

service 'tftp' do
  action :disable
end
