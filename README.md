Ansible Role - Linux Users
==========================
This repo contains the Linux Users (linux_users) Ansible role.

What this role does
-------------------
This Ansible role will create, update, and delete Linux users along with their SSH keys using the inventory.

Changes performed:

1. Create management groups for the users
    1. Create a `sysadmins` group for password-less sudo users
    2. Create a `sysusers` group for non-sudo users
    3. Create a `svcaccounts` group for password-less sudo for service accounts
2. Manage root user
    1. Manage root's password and SSH keys
3. Manage non-root users
    1. Create, Update, Delete user accounts
    2. Create, Update, Delete user home directories
    3. Manage user SSH keys 
    4. Manage user group membership (It's expected to use one of the above groups)

Caveats
-------
There are a few caveats to this role to be aware of:

1. root's password should be pre-encrypted
2. Using multiple SSH keys can be done in one of two ways due to the use of `exclusive: yes`:
    1. a single string with newline characters between keys
    2. Pointing to a GitHub keys URL
3. All non-root users will not have a password set as sudo will be password-less and they aren't expected to have local
login privileges
4. Users with a home directory in `/home/` that aren't defined in `linux_users.users` will be deleted
    1. This is not the best way to manage unapproved users, and is intended to be improved upon in the future

Variables
---------
The following variables are required:

1. `linux_users.root_password` - The pre-encrypted password for root

The following variables are optional:

1. `linux_users.root_key` - The SSH key(s) used by root. If left undefined then root's authorized_keys file is deleted
2. `linux_users.users` - User objects with the following variables. If left undefined then users are not managed
    ```
    users:
      - username: pgibbons
        key: ssh-rsa BLAH BLAH BLAH
        comment: Peter Gibbons
        group: sysadmins
      - username: mbolton
        key: https://github.com/notthatmichaelbolton.keys
        comment: Michael Bolton
        group: sysusers
      - username: svc-ghactions
        key: |
          ssh-rsa BLAH BLAH BLAH
          ssh-rsa BLEH BLEH BLEH
        comment: ServiceAccount-GitHub Actions
        group: svcaccounts
    ```

The following variables should only be used in testing:

1. `is_kitchen` - If this variable is defined the role(s) in `tests/roles` create sample users for testing unapproved user
deletion against. Additionally the `user_cleanup.yml` play will exempt the `vagrant` user from deletion 

Testing
-------
This role is fully tested via Test Kitchen using sample inventory data contained in this repo.  
[TESTING.md](TESTING.md) contains details and instructions for testing. 
