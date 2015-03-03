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

# This is done because scripts/cb search will build sphinx.conf from sphinx.conf.php
# and it will also build out the paths for the index files that sphix uses.
# without this the build will fail to start searchd because none of this is setup.
execute 'Setup SPHINX.CONF and Index paths' do
  command 'env APPLICATION_ENV=vagrant-cluster /var/www/platform/scripts/cb search rotate'
  not_if 'ps -ef | grep -v grep | grep searchd'
end

service 'searchd' do
  action [:enable, :start]
end
