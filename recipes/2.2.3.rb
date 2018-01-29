#
# Cookbook:: cis-centos-linux-7-benchmark-section-two
# Recipe:: 2.2.3
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

service "avahi-daemon" do
  action :disable
end
