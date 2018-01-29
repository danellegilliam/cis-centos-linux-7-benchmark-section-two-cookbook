#
# Cookbook:: cis-centos-linux-7-benchmark-section-two
# Recipe:: 2.2.2
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

execute '2.2.2' do
  command 'yum remove xorg-x11*'
  not_if 'rpm -qa xorg-x11*'
end
