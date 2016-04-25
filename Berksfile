source "https://supermarket.chef.io"

metadata

cookbook 'windows', '~> 1.39.2'
cookbook 'powershell', '~> 3.2.3'
cookbook 'ms_dotnet', '~> 2.6.1', git: 'git@github.com:criteo-cookbooks/ms_dotnet.git',branch: 'dotnet_46'

group :integration do
  cookbook 'dsc-test', path: './test/fixtures/cookbooks/dsc-test'
end
