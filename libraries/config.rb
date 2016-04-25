#
# Cookbook Name:: dsc2
# Library:: config
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

module Dsc
  module Config
    include Chef::Mixin::ShellOut
    include Chef::Mixin::PowershellOut

    def config_provider(name)
      if !provider_installed?(name)
        add_provider = powershell_out!("Get-PackageProvider -Name \'#{name}\' -ForceBootstrap")
        Chef::Log.debug(add_provider.stdout)
        sleep(5)
        add_psgallery_repo
      else
        Chef::Log.info("#{name} Package Provider is already installed, no action needed")
      end
    end

    def provider_installed?(name)
      provider = powershell_out!("(Get-PackageProvider).Name -eq \'#{name}\'").stdout.include?('True')
      Chef::Log.debug(provider)
      provider
    end

    def add_psgallery_repo
      powershell_out!("Set-PSRepository -Name PSGallery -InstallationPolicy Trusted").stdout
    end
  end
end
