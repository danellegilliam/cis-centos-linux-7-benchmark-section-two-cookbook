#
# Cookbook:: cis-centos-linux-7-benchmark-section-two
# Recipe:: 2.1.3
#
# Copyright:: 2018, Danelle Gilliam, All Rights Reserved.

['discard-dgram', 'discard-stream'].each do |item|
  service item do
    action :disable
  end
end
