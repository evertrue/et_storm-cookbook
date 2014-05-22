#
# Cookbook Name:: et_storm
# Recipe:: update-libs
#
# Copyright (C) 2014 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

execute 'extract_httpcomponents' do
  command "tar xzf #{Chef::Config['file_cache_path']}/" \
    'httpcomponents-client-4.2-bin.tar.gz'
  cwd Chef::Config['file_cache_path']
  creates "#{Chef::Config['file_cache_path']}/httpcomponents-client-4.2"
  action :nothing
  notifies :delete, "file[#{node['storm']['lib_dir']}/httpclient-4.1.1.jar]"
  notifies :create, "remote_file[#{node['storm']['lib_dir']}/httpclient-4.2.jar]"
  notifies :create, "remote_file[#{node['storm']['lib_dir']}/httpcore-4.2.jar]"
  notifies :delete, "file[#{node['storm']['lib_dir']}/guava-13.0.jar]"
  notifies :create, "remote_file[#{node['storm']['lib_dir']}/guava-14.0.1.jar]"
  notifies :create, "remote_file[#{node['storm']['lib_dir']}/commons-codec-1.6.jar]"
end

remote_file "#{Chef::Config['file_cache_path']}/httpcomponents-client-4.2-bin.tar.gz" do
  owner 'root'
  group 'root'
  mode '0644'
  source 'http://archive.apache.org/dist/httpcomponents/httpclient/binary/' \
    'httpcomponents-client-4.2-bin.tar.gz'
  checksum 'fab217ab85ac2dc600e1fee2f788bada1243419e15761d47d08ecff14dfd2195'
  notifies :run, 'execute[extract_httpcomponents]'
end

%w(
  httpclient
  httpcore
).each do |jar|
  remote_file "#{node['storm']['lib_dir']}/#{jar}-4.2.jar" do
    owner 'storm'
    group 'storm'
    mode 00644
    source "file://#{Chef::Config['file_cache_path']}/httpcomponents-client-4.2/lib/#{jar}-4.2.jar"
    action :nothing
    notifies :restart, 'service[supervisor]'
  end
end

%w(
  httpclient-4.1.1
  guava-13.0
).each do |cur_file|
  file "#{node['storm']['lib_dir']}/#{cur_file}.jar" do
    action :nothing
  end
end

remote_file "#{node['storm']['lib_dir']}/guava-14.0.1.jar" do
  owner 'storm'
  group 'storm'
  mode 00644
  source 'http://search.maven.org/remotecontent?' \
    'filepath=com/google/guava/guava/14.0.1/guava-14.0.1.jar'
  checksum 'd69df3331840605ef0e5fe4add60f2d28e870e3820937ea29f713d2035d9ab97'
  action :nothing
  notifies :restart, 'service[supervisor]'
end

remote_file "#{node['storm']['lib_dir']}/commons-codec-1.6.jar" do
  owner 'storm'
  group 'storm'
  mode 00644
  source "file://#{Chef::Config['file_cache_path']}/" \
    'httpcomponents-client-4.2/lib/commons-codec-1.6.jar'
  action :nothing
  notifies :restart, 'service[supervisor]'
end
