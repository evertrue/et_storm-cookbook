#
# Cookbook Name:: et_storm
# Recipe:: nimbus
#
# Copyright (C) 2014 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'et_storm::default'

node.set['storm']['supervisor']['workers'] = 1

include_recipe 'apache_storm::nimbus'
