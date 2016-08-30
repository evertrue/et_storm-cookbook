#
# Cookbook Name:: et_storm
# Recipe:: default
#
# Copyright (C) 2014 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

node.set['storm']['yaml']['ui.childopts'] = '-Xmx256m'
