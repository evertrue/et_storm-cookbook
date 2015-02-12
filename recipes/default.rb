#
# Cookbook Name:: et_storm
# Recipe:: default
#
# Copyright (C) 2014 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

node.set['java']['jdk_version'] = '7'
node.set['java']['java_home'] = '/usr/lib/jvm/java-7-openjdk-amd64'
node.set['java']['java_exec'] = node['java']['java_home'] + '/bin/java'

node.set['storm']['yaml']['ui.childopts'] = '-Xmx256m'
