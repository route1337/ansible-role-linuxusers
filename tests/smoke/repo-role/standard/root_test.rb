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

if os[:name] == 'ubuntu'

  # Verify the root user's password was set
  describe file('/etc/shadow') do
    its('content') { should match /root:\$6\$i1\.aY3d9\$xSnxa38gJ9MEOH0brIQeP2K51daP\.ljTX9\/vQcLR16jmMp7hTAZyBpYwuGfodbxAZdpuTI7g1CEFmTOtCBOcY1/ }
  end

  # Verify root's SSH keys were set properly using the test data
  describe file('/root/.ssh/authorized_keys') do
    it { should exist }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 0600 }
    its('content') { should match /ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDS\+TTfaJu5vlCba5mb\/DmnqLhc2LC0e\+QbSp2GJQOGY5gap7TzjRXsp7Dl\/xub\+e4NLfooOTwXjMYpKFtF\/Zn3phULSAqPzoLxBBa1L4QUcpP0AoEU7fHvKkhLa0QpT73r694pr9l6Tw4jYCmRRlomzFmsymuZrnvi5v6Q0JUxMQDRIW01vaT2hGR36BuzXeWpCiif6i0LRvyh1DcW2k1pZCA8bNlk\/kVQD28lA3a7TxzWgnF\+xfdXZalw7zpBtFoSw23N1C5\/TXNIcHWiaJrXg\/oJn7FMZeC7nLvYt9aF2XImMHvfbo\+ONWgWYUtCoqLac0aTXhwWlb\+R5mOT6l8p1Vo37KFONZp6fJcaICGE0yVGKE\+GCewgzVp3kpAtBmEIX\/Uf5lr6Yf0OiGmN3DggEMeMpewnTzO9tnR92VolU8YBPhOGsdYt8z\+EdicXdqQ9bpoHRmxUL94O4GJvrROnVeoltRZijKZpRAw\/hAzGilxDOJovAL4eaRwyC8s8iZfnY\+jcocAU2\+lcX5czYrVzM0NeXfhhAlAAr\/4tXLMPWmDnNK3vLMSGcwb6KHAn1bjalcEkLYr3tVWCMEbPKS2Cz2ZL7Uf5WhGl5H3vlxFdxocFiX0FPnI2xAipAh2E5emy1QqtPUTtorp2Z2mQiYceQDNWq8Hk1r4KZTYnCGT49Q== cardno:000611159926/ }
    its('content') { should match /ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr\+kz4TjGYe7gHzIw\+niNltGEFHzD8\+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL\+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm\+R4LOzFUGaHqHDLKLX\+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key/ }
  end

else
  # Do nothing
end
