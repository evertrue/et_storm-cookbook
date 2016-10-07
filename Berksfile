source :chef_server
source 'https://supermarket.chef.io'

metadata

group :integration do
  cookbook 'apache_storm', path: '../apache_storm'
  cookbook 'et_tools', '~> 1.0'
  cookbook 'test_env', path: 'test/integration/cookbooks/test_env'
end
