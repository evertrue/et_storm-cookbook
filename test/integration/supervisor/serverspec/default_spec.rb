require 'spec_helper'

describe 'Storm Supervisor' do
  # This only works with Nimbus running as well
  # it 'is listening on port 6702' do
  #   expect(port(6702)).to be_listening
  # end

  it 'has a running service of supervisor' do
    expect(service('supervisor')).to be_running
  end

  describe file '/opt/storm/current/logs' do
    it { is_expected.to be_linked_to '/mnt/storm/logs' }
  end
end

describe command('tar -tzf /tmp/kitchen/cache/httpcomponents-client-4.2-bin.tar.gz') do
  its(:stdout) { should match(/README\.txt/) }
end

describe command('pgrep java') do
  its(:exit_status) { should eq 0 }
end

describe file('/tmp/kitchen/cache/httpcomponents-client-4.2') do
  it { should be_directory }
end

[
  'guava-14.0.1.jar',
  'commons-codec-1.6.jar',
  'httpclient-4.2.jar',
  'httpcore-4.2.jar'
].each do |jar_file|
  describe file("/opt/storm/apache-storm-0.9.1-incubating/lib/#{jar_file}") do
    it { should be_file }
  end
end
