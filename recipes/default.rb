#
# Cookbook Name:: role-sphinx
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'sphinx::rpm'
include_recipe 'yum'
include_recipe 'yum-epel'

template '/etc/init.d/searchd' do
  source 'searchd_init.erb'
  owner 'root'
  group 'root'
  variables(
  :config_file => node[:sphinx][:config_file]
  )
  action :create
end

service 'searchd' do
  action :start
end
