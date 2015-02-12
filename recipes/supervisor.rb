#
# Cookbook Name:: et_storm
# Recipe:: supervisor
#
# Copyright (C) 2014 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'et_storm::default'

node.set['storm']['supervisor']['workers'] = 4
node.set['storm']['yaml']['supervisor.childopts'] = '-Xmx768m'
node.set['storm']['yaml']['worker.childopts'] = '-Xmx768m ' \
  '-XX:+UseConcMarkSweepGC -Dcom.sun.management.jmxremote ' \
  '-Djdk.xml.entityExpansionLimit=0'

include_recipe 'et_swap::disable'
include_recipe 'apache_storm::supervisor'
include_recipe 'et_storm::update-libs'
