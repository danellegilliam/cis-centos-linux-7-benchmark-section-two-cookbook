# # encoding: utf-8

# Inspec test for recipe cis-centos-linux-7-benchmark-section-two::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

control "2.1.1" do
  impact 1.0
  title "Ensure chargen services are not enabled (Scored)"
  desc "chargen is a network service that responds with 0 to 512 ASCII characters for each connection it receives. This service is intended for debugging and testing purposes. It is recommended that this service be disabled."
  describe systemd_service('chargen-dgram') do
    it { should_not be_enabled }
  end
  describe systemd_service('chargen-stream') do
    it { should_not be_enabled }
  end
end

control "2.1.2" do
  impact 1.0
  title "Ensure daytime services are not enabled (Scored)"
  desc "daytime is a network service that responds with the server's current date and time. This service is intended for debugging and testing purposes. It is recommended that this service be disabled."
  describe systemd_service('daytime-dgram') do
    it { should_not be_enabled }
  end
  describe systemd_service('daytime-stream') do
    it { should_not be_enabled }
  end
end

control "2.1.3" do
  impact 1.0
  title "Ensure discard services are not enabled (Scored)"
  desc "discard is a network service that simply discards all data it receives. This service is intended for debugging and testing purposes. It is recommended that this service be disabled."
  describe systemd_service('discard-dgram') do
    it { should_not be_enabled }
  end
  describe systemd_service('discard-stream') do
    it { should_not be_enabled }
  end
end

control "2.1.4" do
  impact 1.0
  title "Ensure echo services are not enabled (Scored)"
  desc "echo is a network service that responds to clients with the data sent to it by the client. This service is intended for debugging and testing purposes. It is recommended that this service be disabled."
  describe systemd_service('echo-dgram') do
    it { should_not be_enabled }
  end
  describe systemd_service('echo-stream') do
    it { should_not be_enabled }
  end
end

control "2.1.5" do
  impact 1.0
  title "Ensure time services are not enabled (Scored)"
  desc "time is a network service that responds with the server's current date and time as a 32 bit integer. This service is intended for debugging and testing purposes. It is recommended that this service be disabled."
  describe systemd_service('time-dgram') do
    it { should_not be_enabled }
  end
  describe systemd_service('time-stream') do
    it { should_not be_enabled }
  end
end

control "2.1.6" do
  impact 1.0
  title "Ensure tftp server is not enabled (Scored)"
  desc "Trivial File Transfer Protocol (TFTP) is a simple file transfer protocol, typically used to automatically transfer configuration or boot machines from a boot server. The package tftp-server is used to define and support a TFTP server."
  describe systemd_service('tftp') do
    it { should_not be_enabled }
  end
end

control "2.1.7" do
  impact 1.0
  title "Ensure xinetd is not enabled (Scored)"
  desc "The eXtended InterNET Daemon ( xinetd ) is an open source super daemon that replaced the original inetd daemon. The xinetd daemon listens for well known services and dispatches the appropriate daemon to properly respond to service requests."
  describe systemd_service('xinetd') do
    it { should_not be_enabled }
  end
end

control "2.2.1.1" do
  impact 1.0
  title "Ensure time synchronization is in use (Not Scored)"
  desc "System time should be synchronized between all systems in an environment. This is typically done by establishing an authoritative time server or set of servers and having all systems synchronize their clocks to them."
  describe package('ntp') do
    it { should be_installed }
  end
  describe package('chrony') do
    it { should be_installed }
  end
end

control "2.2.1.2" do
  impact 1.0
  title "Ensure ntp is configured (Scored)"
  desc "ntp is a daemon which implements the Network Time Protocol (NTP). It is designed to synchronize system clocks across a variety of systems and use a source that is highly accurate. More information on NTP can be found at http://www.ntp.org. ntp can be configured to be a client and/or a server."
  only_if do
    file('/etc/ntp.conf').exist?
  end
  describe file('/etc/ntp.conf') do
    its('content') { should match /restrict -4 default kod nomodify notrap nopeer noquery/ }
    its('content') { should match /restrict -6 default kod nomodify notrap nopeer noquery/ }
    its('content') { should match /server .*/ }
  end
  describe file('/etc/sysconfig/ntpd') do
    its('content') { should match /OPTIONS=\"-u ntp:ntp\"/ }
  end
  describe file('/usr/lib/systemd/system/ntpd.service') do
    its('content') { should match /ExecStart=\/usr\/sbin\/ntpd -u ntp:ntp \$OPTIONS/ }
  end
end

control "2.2.1.3" do
  impact 1.0
  title "Ensure chrony is configured (Scored)"
  desc "chrony is a daemon which implements the Network Time Protocol (NTP) is designed to synchronize system clocks across a variety of systems and use a source that is highly accurate. More information on chrony can be found at http://chrony.tuxfamily.org/. chrony can be configured to be a client and/or a server."
  describe file('/etc/chrony.conf') do
    its('content') { should match /server .*/ }
  end
  describe file('/etc/sysconfig/chronyd') do
    its('content') { should match /OPTIONS=\"-u chrony\"/ }
  end
end

control "2.2.2" do
  impact 1.0
  title "Ensure X Window System is not installed (Scored)"
  desc "The X Window System provides a Graphical User Interface (GUI) where users can have multiple windows in which to run programs and various add on. The X Windows system is typically used on workstations where users login, but not on servers where users typically do not login."
  describe command('rpm -qa xorg-x11*') do
    its('stdout') { should eq '' }
  end
end

control "2.2.3" do
  impact 1.0
  title "Ensure Avahi Server is not enabled (Scored)"
  desc "Avahi is a free zeroconf implementation, including a system for multicast DNS/DNS-SD service discovery. Avahi allows programs to publish and discover services and hosts running on a local network with no specific configuration. For example, a user can plug a computer into a network and Avahi automatically finds printers to print to, files to look at and people to talk to, as well as network services running on the machine."
  describe systemd_service('avahi-daemon') do
    it { should_not be_enabled }
  end
end
