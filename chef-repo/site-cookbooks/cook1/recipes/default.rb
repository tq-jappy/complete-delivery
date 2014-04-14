#
# Cookbook Name:: cook1
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
template "/tmp/hello.txt" do
  source "hello.txt.erb"
  mode 0644
end
