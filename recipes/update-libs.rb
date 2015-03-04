#
# Cookbook Name:: et_storm
# Recipe:: update-libs
#
# Copyright (C) 2014 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

httpcomponents_version = '4.4'
httpcomponents_checksum = '77e78664598fc63c9bafbdecc1695dd59c7b5ba7afd8ef2a92ddae1074cdc579'

execute 'extract_httpcomponents' do
  command "tar xzf #{Chef::Config['file_cache_path']}/" \
    "httpcomponents-client-#{httpcomponents_version}-bin.tar.gz"
  cwd Chef::Config['file_cache_path']
  creates "#{Chef::Config['file_cache_path']}/httpcomponents-client-#{httpcomponents_version}"
  action :nothing
end

remote_file "#{Chef::Config['file_cache_path']}/httpcomponents-client-#{httpcomponents_version}-bin.tar.gz" do
  owner 'root'
  group 'root'
  mode '0644'
  source 'http://archive.apache.org/dist/httpcomponents/httpclient/binary/' \
    "httpcomponents-client-#{httpcomponents_version}-bin.tar.gz"
  checksum httpcomponents_checksum
  notifies :run, 'execute[extract_httpcomponents]'
end

%w(
  httpclient
  httpcore
).each do |jar|
  remote_file "#{node['storm']['lib_dir']}/#{jar}-#{httpcomponents_version}.jar" do
    owner 'storm'
    group 'storm'
    mode 00644
    source "file://#{Chef::Config['file_cache_path']}/httpcomponents-client-#{httpcomponents_version}/lib/#{jar}-#{httpcomponents_version}.jar"
    notifies :restart, 'service[supervisor]'
  end
end

%w(commons-codec-1.6
   guava-14.0.1
   httpclient-4.2
   httpcore-4.2).each do |cur_file|
  file "#{node['storm']['lib_dir']}/#{cur_file}.jar" do
    action :delete
    notifies :restart, 'service[supervisor]'
  end
end

remote_file "#{node['storm']['lib_dir']}/guava-18.0.jar" do
  owner 'storm'
  group 'storm'
  mode 00644
  source 'http://search.maven.org/remotecontent?' \
    'filepath=com/google/guava/guava/18.0/guava-18.0.jar'
  checksum 'd664fbfc03d2e5ce9cab2a44fb01f1d0bf9dfebeccc1a473b1f9ea31f79f6f99'
  action :nothing
  subscribes :run, 'execute[extract_storm]'
  notifies :restart, 'service[supervisor]'
end

remote_file "#{node['storm']['lib_dir']}/commons-codec-1.9.jar" do
  owner 'storm'
  group 'storm'
  mode 00644
  source "file://#{Chef::Config['file_cache_path']}/" \
    "httpcomponents-client-#{httpcomponents_version}/lib/commons-codec-1.9.jar"
  notifies :restart, 'service[supervisor]'
end
