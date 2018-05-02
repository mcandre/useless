# useless: a replacement part for missing -a -G functionality in usermod

# ABOUT

useless emits an augmented copy of a UNIX group file, with the configured group's entry modified to append the desired username. This shim is useful for automatically updating groups in environments where a system's `usermod` command omits the typical `-a`, `-G` flags to perform this operation.

For manual group changes, `nano`, `cat`, `echo`, etc. can safely edit the `/etc/group` file. However, this requires some care to avoid accidentally corrupting the file. This shim provides a more reliable, automated workflow, intended for system administrators, Continuous Integration servers, virtual machine configuration, and so on.

# EXAMPLE

```console
$ sudo cp /etc/group /etc/group.bak

$ USERNAME=beer GROUP=party su user -c 'awk -f lib/useless.awk < /etc/group > /etc/group.new'

$ diff /etc/group /etc/group.new
3c3
< party:x:101:sshd,user
---
> party:x:101:sshd,user,beer

$ sudo cp /etc/group.new /etc/group
```

# REQUIREMENTS

* GNU awk

## Recommended

* diff

# INSTALL

1. Clone https://github.com/mcandre/useless.git
