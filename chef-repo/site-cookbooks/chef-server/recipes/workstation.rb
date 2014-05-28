#
# Cookbook Name:: chef-server
# Recipe:: chef_client
#
# Copyright 2014, Takumi Endo
#
# All rights reserved - Do Not Redistribute
#
rpm_package "chef" do
  action :remove
  not_if "rpm -qa | grep chef | grep 11.10"
end

rpm_package "chef" do
  action :install
  source node["chef_client"]["rpm_file"]
end

template "/root/.chef/knife.rb" do
  mode 0644
  action :create
end

bash "knife configure --initial" do
  user 'root'
  code <<-EOL
    knife configure --initial --config /root/.chef/knife.rb
    cp /etc/chef-server/admin.pem /etc/chef
    cp /etc/chef-server/chef-validation.pem /etc/chef/validation.pem
  EOL
  not_if { File.exist?("/etc/chef/validation.pem")
end
