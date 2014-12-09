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
