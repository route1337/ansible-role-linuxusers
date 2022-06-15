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

  # Verify the sample user "baduser" no longer exists
  describe user('baduser') do
    it { should_not exist }
  end

  # Verify the sample user "baduser" no longer has a home directory
  describe file('/home/baduser') do
    it { should_not exist }
  end

else
  # Do nothing
end
