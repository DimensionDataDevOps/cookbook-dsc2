#
# Cookbook Name:: dsc2
# Resource:: dsc
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

property :name, String, name_property: true, required: true
property :source, String
property :pkg_provider, String, default: 'NuGet'
property :version, String

actions :install

default_action :install

provides :dsc

include Dsc::Config

def whyrun_supported?
  true
end

action :install do
  config_provider(pkg_provider)
  install_module = powershell_out!("Install-Module -Name #{name}")
  Chef::Log.debug(install_module.stdout)
end
