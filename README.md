dsc Cookbook
============
Install DSC Modules from powershellgallery.com

Requirements
------------
#### Platforms (tested)
- Windows Server 2012 (R2)

#### Chef
- Chef 12.8.1+

#### Package
- All tested platforms must have [WMF 5.0](https://www.microsoft.com/en-us/download/details.aspx?id=50395) installed (`DSCResource` only works on Powershell `>= 5.0` ) and .NET 4.6.1

#### Cookbooks
- `windows`, `~> 1.39.2`
- `powershell`, `~> 3.2.3`
- `ms_dotnet`, `~> 2.6.1`

Usage
-----
#### dsc2::default
Add `include_recipe dsc2::default` in your recipe to make sure that WFM 5.0 and .NET 4.6.1 are installed.

#### Example
Example recipe that checks if PowerShell 5.0 and .NET 4.6.1 are installed first before running the `dsc` custom resource

```
chk_posh = powershell_out!("$PSVersionTable.PSVersion.Major -ge '5'")
chk_reg = powershell_out!('(Get-ItemProperty -Path Registry::\'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\').Release')

if !chk_posh.stdout.include?('True')
  include_recipe 'dsc2'
else
  Chef::Log.info('WFM 5.0 and .NET 4.6.1 or above are installed, skipping')
end

dsc 'OctopusProjectsDSC' do
  action :install
end
```

Contributing
------------
- Fork the repository on Github
- Create a named feature branch (like `add_component_x`)
- Write your change
- Write tests for your change (if applicable)
- Run the tests, ensuring they all pass
- Submit a Pull Request using Github

License and Author(s)
-------------------
- Author: Eugene Narciso (<eugene.narciso@itaas.dimensiondata.com>)

```text
Copyright:: 2016, Dimension Data Cloud Solutions, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
