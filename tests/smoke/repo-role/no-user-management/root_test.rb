#
# Project:: Ansible Role - Linux Users
#
# Copyright 2020, Route 1337, LLC, All Rights Reserved.
#
# Maintainers:
# - Matthew Ahrenstein: matthew@route1337.com
#
# See LICENSE
#

# Test the root user settings using test data

if ['ubuntu', 'centos'].include?(os[:name])

  # Verify the root user's password was set
  describe file('/etc/shadow') do
    its('content') { should match /root:\$6\$i1\.aY3d9\$xSnxa38gJ9MEOH0brIQeP2K51daP\.ljTX9\/vQcLR16jmMp7hTAZyBpYwuGfodbxAZdpuTI7g1CEFmTOtCBOcY1/ }
  end

  # Verify root's authorized_keys file does not exist
  describe file('/root/.ssh/authorized_keys') do
    it { should_not exist }
  end

else
  # Do nothing
end
