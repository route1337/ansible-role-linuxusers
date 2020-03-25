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

# Test the creation and updating of users

if ['ubuntu', 'centos'].include?(os[:name])

  # Verify the sample user "pgibbons" was not created
  describe user('pgibbons') do
    it { should_not exist }
  end

  # Verify the sample user "ahrenstein" was not created
  describe user('ahrenstein') do
    it { should_not exist }
  end

  # Verify the sample user "svc-ghactions" was not created
  describe user('svc-ghactions') do
    it { should_not exist }
  end

else
  # Do nothing
end
