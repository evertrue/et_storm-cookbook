package 'zookeeper'
package 'zookeeperd'

node.override['etc_environment']['VAULT_ADDR'] = 'http://vault.service.us-east-1.consul:8200'
node.override['etc_environment']['VAULT_TOKEN'] = 'TEST_TOKEN'

directory '/etc/profile.d'

file '/etc/environment' do
  content node['etc_environment'].map { |k, v| "#{k}=#{v}" }.join("\n")
end

file '/etc/profile.d/evertrue.sh' do
  content lazy { (exports_config(node['etc_environment']) + "\n") }
end

cookbook_file '/etc/hosts'
