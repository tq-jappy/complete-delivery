#
# Cookbook Name:: chef-server
# Recipe:: default
#
# Copyright 2014, Takumi Endo
#
# All rights reserved - Do Not Redistribute
#
template "/etc/hosts" do
  owner 'root'
  group 'root'
  mode 0644
end

rpm_package "chef-server" do
  action :install
  source node["chef_server"]["rpm_file"]
end
