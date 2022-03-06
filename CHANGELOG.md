Ansible Role - Linux Users: Changelog
=====================================
A list of all the changes made to this repo and the role it contains

Version 1.2.3
-------------

1. Adding missing `test-kitchen` gem to Gemfile

Version 1.2.2
-------------

1. Install zsh if it's missing
2. Users now use zsh as their default shell

Version 1.2.1
-------------

1. Adding Ubuntu 20.04 to metadata file.

Version 1.2.0
-------------

1. Added testing and support for Ubuntu 20.04

Version 1.1.0
-------------

1. Added support for CentOS 7 and 8

Version 1.0.3
-------------

1. Fixed an issue with the sysadmins and svcaccounts groups being specified as users and not groups in `/etc/sudoers`
(Missing `%`)

Version 1.0.2
-------------

1. Due to the fact that Ansible will configure a variable as defined and set some data in it as skipped if the task that
creates it is skipped, the vagrant user exemption for user cleanup now uses a different variable name and different
deletion block.

Version 1.0.1
-------------

1. Moved test user creation to a role located at `test/roles/generate-test-data` in order to avoid production use of
the role always showing it skip test users with suspicious names
2. Documentation updates around what the `is_kitchen` variable does

Version 1.0.0
-------------

1. Initial Release of repository

Role Changes:

1. Initial release

Return to [README](README.md)
