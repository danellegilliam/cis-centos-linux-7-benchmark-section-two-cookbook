#
# Cookbook:: cis-centos-linux-7-benchmark-section-two
# Recipe:: 2.1.4
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

['echo-dgram', 'echo-stream'].each do |item|
  service item do
    action :disable
  end
end
