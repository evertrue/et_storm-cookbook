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

sudo 'deploy_topology' do
  user 'deploy'
  nopasswd true
  commands([
    '/opt/storm/current/bin/storm kill *',
    '/opt/storm/current/bin/storm jar *'
  ])
end

%w(list-topologies
   kill-topology).each do |f|
  cookbook_file "/usr/bin/#{f}" do
    source f
    mode   0755
  end
end
