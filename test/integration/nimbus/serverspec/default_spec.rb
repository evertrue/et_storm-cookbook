require 'spec_helper'

describe command('pgrep java') do
  it { should return_exit_status 0 }
end

describe 'Storm Nimbus' do
  # This only works with Nimbus running as well
  # it 'is listening on port 6702' do
  #   expect(port(6702)).to be_listening
  # end

  describe service('nimbus') do
    it { should be_running }
  end

  describe port(6627) do
    it { should be_listening.with('tcp6') }
  end

  describe port(8080) do
    it { should be_listening.with('tcp6') }
  end

  describe command('wget -O - http://localhost:8080/') do
    it { should return_stdout(/Nimbus uptime/) }
  end
end

describe 'Storm Topology deploy sudoers' do
  describe file '/etc/sudoers.d/deploy_topology' do
    it { should be_file }
    its(:content) { should include '/opt/storm/current/bin/storm kill *' }
    its(:content) { should include '/opt/storm/current/bin/storm jar *' }
  end
end
