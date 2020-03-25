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

# Prereqs tests

if ['ubuntu', 'centos'].include?(os[:name])

  # Verify the sysadmins group exists
  describe group('sysadmins') do
    it { should exist }
    its('gid') { should eq 1337}
  end

  # Verify the sysusers group exists
  describe group('sysusers') do
    it { should exist }
    its('gid') { should eq 8737}
  end

  # Verify the svcaccounts group exists
  describe group('svcaccounts') do
    it { should exist }
    its('gid') { should eq 7782}
  end

  # Verify sysadmins and svcaccounts have password-less sudo and sysusers do not get mentioned
  describe file('/etc/sudoers') do
    its('content') { should match /%sysadmins ALL=\(ALL\) NOPASSWD: ALL/ }
    its('content') { should_not match /sysusers/ }
  end

else
  # Do nothing
end
