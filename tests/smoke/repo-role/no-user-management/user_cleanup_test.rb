#
# Project:: Ansible Role - Linux Users
#
# Copyright 2020, Route 1337 LLC, All Rights Reserved.
#
# Maintainers:
# - Matthew Ahrenstein: matthew@route1337.com
#
# See LICENSE
#

# Test the deletion and cleanup of unapproved users

if ['ubuntu', 'centos'].include?(os[:name])

  # Verify the sample user "baduser" still exists
  describe user('baduser') do
    it { should exist }
    its('group') { should eq 'users' }
    its('home') { should eq '/home/baduser' }
    its('shell') { should eq '/bin/bash' }
  end

  # Verify the sample user "baduser" has the correct SSH key(s)
  describe file('/home/baduser/.ssh/authorized_keys') do
    it { should exist }
    it { should be_owned_by 'baduser' }
    it { should be_grouped_into 'users' }
    it { should be_mode 0600 }
    its('content') { should match /ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr\+kz4TjGYe7gHzIw\+niNltGEFHzD8\+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL\+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm\+R4LOzFUGaHqHDLKLX\+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key/ }
  end

else
  # Do nothing
end
