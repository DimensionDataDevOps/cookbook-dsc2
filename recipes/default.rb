#
# Cookbook Name:: dsc2
# Recipe:: default
# Author:: Eugene Narciso (<eugene.narciso@itaas.dimensiondata.com>)
#
# Copyright 2016, Dimension Data Cloud Solutions, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node.override['ms_dotnet']['v4']['version'] = '4.6.1'
node.override['ms_dotnet']['v4']['package_sources'] = {
  beaa901e07347d056efe04e8961d5546c7518fab9246892178505a7ba631c301: 
  'https://download.microsoft.com/download/E/4/1/E4173890-A24A-4936-9FC9-AF930FE3FA40/NDP461-KB3102436-x86-x64-AllOS-ENU.exe'
}

include_recipe 'ms_dotnet::ms_dotnet4'
include_recipe 'powershell::powershell5'
