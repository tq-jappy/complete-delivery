complete-delivery
=================

An example (in progress)

- Jenkins
- Capistrano3
- Chef
- Serverspec
- Vagrant and/or Docker

## VM

- chef-server (192.168.33.10)
 - Chef Server & Workstation
- repository (192.168.33.20)

## Prepare

1. Download Chef Server RPM file (share/chef-server/chef-server-11.0.12-1.el6.x86_64.rpm)
2. add entry ``192.168.33.10 chef-server`` (/etc/hosts)

## Setup

```
[host]# vagrant box add centos {box url}
```

## Knife bootstrap

```
[chef-server]# knife bootstrap 192.168.33.20 --template-file=rhel6-bootstrap.erb -P vagrant
```

## Build

```
[host]# vagrant up chef_server
```
