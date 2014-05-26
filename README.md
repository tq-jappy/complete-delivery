complete-delivery
=================

An example (in progress)

- Jenkins
- Capistrano3
- Chef
- Serverspec
- Vagrant and/or Docker

## Prepare

1. Download Chef Server RPM file (share/chef-server/chef-server-11.0.12-1.el6.x86_64.rpm)
2. add entry ``192.168.33.10 chef-server`` (/etc/hosts)

## Setup

```
[host]# vagrant box add centos {box url}
```

## Build

```
[host]# vagrant up chef_server
```
