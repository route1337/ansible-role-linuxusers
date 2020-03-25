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

  # Verify the sample user "pgibbons" was created
  describe user('pgibbons') do
    it { should exist }
    its('gid') { should eq 8737 }
    its('group') { should eq 'sysusers' }
    its('home') { should eq '/home/pgibbons' }
    its('shell') { should eq '/bin/bash' }
  end

  # Verify the sample user "pgibbons" has the correct SSH key(s)
  describe file('/home/pgibbons/.ssh/authorized_keys') do
    it { should exist }
    it { should be_owned_by 'pgibbons' }
    it { should be_grouped_into 'sysusers' }
    it { should be_mode 0600 }
    its('content') { should match /ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDB3ER0j1qm6ksFX7jry9s4S3rpocw4q2HAhhaw4s82wY\+0XUx2pMm8hrbe2H6Z9Cs1t0Vyp1FtFhd9DcD9lhS3fVG4od2pnL1u8B9vwiy95xth1uPeInnbqak2Yo\/SV08QKC4ys961IdOdiKiyW8z6aqNtnt0JZSatZ5uWHPxnV4r7ikZJKduGldCusj3kXjcBPPLSgfsdcoEtxXMByaisDqXFlp5zunXsrZJjcu\+18o79\/kx\+gLfHt67TEMlrqs\+w1QIHgQPRcEcyGIhmtJntgVMC\+Qyr8HuRjjLI9gFAbQQGkdlm1n73ngE05\+1f6T05GpfuAxLKpc9jjqNJ35LBNoIzrn84NjUSzhQKDEqMZqStb5C68jNxoQ7zPAWwG44oFz1bzdDyUCo8wbPKlt6Rh2gulWfpQC8hy\+EO63L9uw2RvZa\+pDQDHNLqnN\/sVBRzgP5FPdFUGaJMPNpL\/xZitVQ64TFIA8CMPilruV\+wOdMg72u21r52nd8UVcxnQZLmjcRBzZxKmuEi9GaPQEKXOUgt361pAtVqMlRrEihgGKGiImNvQOOASNGBcIzdXBYGVTfQndCHQHBPmR0PzroJbab50TYggaCPfZzsDFe5irvZ1lGxIUTBmJazHTcjI\/OmxoGC74qd9nfsV4HNGtpKKZWf3mb3q\+RsJaJCMJj\+wQ== Peter Gibbons/ }
  end

  # Verify the sample user "ahrenstein" was created
  describe user('ahrenstein') do
    it { should exist }
    its('gid') { should eq 1337 }
    its('group') { should eq 'sysadmins' }
    its('home') { should eq '/home/ahrenstein' }
    its('shell') { should eq '/bin/bash' }
  end

  # Verify the sample user "ahrenstein" has the correct SSH key(s)
  describe file('/home/ahrenstein/.ssh/authorized_keys') do
    it { should exist }
    it { should be_owned_by 'ahrenstein' }
    it { should be_grouped_into 'sysadmins' }
    it { should be_mode 0600 }
    its('content') { should match /ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDS\+TTfaJu5vlCba5mb\/DmnqLhc2LC0e\+QbSp2GJQOGY5gap7TzjRXsp7Dl\/xub\+e4NLfooOTwXjMYpKFtF\/Zn3phULSAqPzoLxBBa1L4QUcpP0AoEU7fHvKkhLa0QpT73r694pr9l6Tw4jYCmRRlomzFmsymuZrnvi5v6Q0JUxMQDRIW01vaT2hGR36BuzXeWpCiif6i0LRvyh1DcW2k1pZCA8bNlk\/kVQD28lA3a7TxzWgnF\+xfdXZalw7zpBtFoSw23N1C5\/TXNIcHWiaJrXg\/oJn7FMZeC7nLvYt9aF2XImMHvfbo\+ONWgWYUtCoqLac0aTXhwWlb\+R5mOT6l8p1Vo37KFONZp6fJcaICGE0yVGKE\+GCewgzVp3kpAtBmEIX\/Uf5lr6Yf0OiGmN3DggEMeMpewnTzO9tnR92VolU8YBPhOGsdYt8z\+EdicXdqQ9bpoHRmxUL94O4GJvrROnVeoltRZijKZpRAw\/hAzGilxDOJovAL4eaRwyC8s8iZfnY\+jcocAU2\+lcX5czYrVzM0NeXfhhAlAAr\/4tXLMPWmDnNK3vLMSGcwb6KHAn1bjalcEkLYr3tVWCMEbPKS2Cz2ZL7Uf5WhGl5H3vlxFdxocFiX0FPnI2xAipAh2E5emy1QqtPUTtorp2Z2mQiYceQDNWq8Hk1r4KZTYnCGT49Q==/ }
  end

  # Verify the sample user "svc-ghactions" was created
  describe user('svc-ghactions') do
    it { should exist }
    its('gid') { should eq 7782 }
    its('group') { should eq 'svcaccounts' }
    its('home') { should eq '/home/svc-ghactions' }
    its('shell') { should eq '/bin/bash' }
  end

  # Verify the sample user "svc-ghactions" has the correct SSH key(s)
  describe file('/home/svc-ghactions/.ssh/authorized_keys') do
    it { should exist }
    it { should be_owned_by 'svc-ghactions' }
    it { should be_grouped_into 'svcaccounts' }
    it { should be_mode 0600 }
    its('content') { should match /ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDa68nxgBj9mIkSN3lWoMgW1HKNpxRsNWTPW\/zNPGt6erE9SiSkpAaiNJD\+9woOERLR4CmAbNoowDuzr6oyEZ\+ZTYWNHNSfAM9eU4x50R7j\/oDkNtkn2JOcPKPlGo4ZSeJqRpjTNOt3YdL\/lQ3BYmgo6eTd6xABGb1inMhSMrYg69X99MDNJR8Fewhuumt4X5zlGoIV\/6nWIUaFHu2c6k4HGBhm2kh7Lu4bpRRGuOGg5LEqgag22PZqWHxKDhWvIakSZjtgYn2HFIC4oiZf1Dz\+\/sF9nkRwc\+JBENkrFTVsIBk8k8lV97QvblTGp\/NRrxWFQnuqkPkQYfLkEDj\+WLAHzef1Ayn7gyGcaWlK8e3S3DxaNKQUhkzvf04\+Iyi0561VnL4fX2xC\/REhPsJXcp9lbonxf1bUkoRm97NUF74AlPF0QckNeqtErZfwxkO4VdFvqhCfK\/h\+QjX47Jl6RZrDC0Odkm5mGbGCTqYbKuSUxpWNinBkfRayzXoxXD2liEpMV32quTMjkxYAKOfdTqiYTKLx0nrL8uy\+V2NwGgDTxt77J\+KIC8PntLx3z3hEgm5XUqTeJK5HigK4PAJgnXYXCSL\+I4Z6JKmma0gjMDSpZqWSPOHG426rGWFInXPw\/pfjsyVzQCheEiNDI0f9ng\+m\/TmK31SYez8wYLRDFFhwiw== GHActions1/ }
    its('content') { should match /ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDmr88spssMKoKh6ewzHT5iWo\/6Rsvb3p8bcEMlLOP2diFUEKBCv8k67cZxFf7eQ0m2M08HBRX226myj2GwULBJUCawUA\/PzWSXOfpycCCGqB48esQwhWI\/7K\+OsjmkauuKg\/4VsnZUaxHZs7\/ivxFM7EPYwfjglqwmjz1gX\+ygPG\/Svz7pdYJMgByATKYzONPSEhCpaP3dhtHtzXYyitOa9fxVWxyvNks2TJ2oDY4TgeYcG\/DKWrncM0ONyBIapp62ompHTnwFf7hBPhPteARgSyB8MzFln9gsg6RjCwTaDtY8bvUEecdrhUK1aWcBq\+OnN9YiYz0jq4\/xP5Z6DMu1F\+EG7VD\/LZPx9wqQ91oVJQDDLKVVPULUsTgF2jdy0AvO\+GVbh3ujH06FCG2xtIJp\+synoCvgEg9Ya9dU720Z4KJx62cfaAujClJoiu3jvOMUD\+xzQZYh1\/t8pzi5u2Kr\+nt\/HKPJQrXQWTASQpNjTMkCBrP03LnJb9a3KYLEuvrKvACY5ggkm8J\/2CaHdbOgX5dGpjviy8X\/H0ZGM21kC1eEAGKsRZLPhCrE82TFKS8Y6sdhSxSOqr5AloQlHY\/G2\+4MwsjPj26dQ39jCscDf0LrIZ5Cr3YW\+kHNxVRxNLKgzxv6qAqy6dlFawwCXfoHRmH738Zuh5XhlV25TL15Xw== GHActions2/ }
  end

else
  # Do nothing
end
