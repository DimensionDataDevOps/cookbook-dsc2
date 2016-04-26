chk_posh = powershell_out!("$PSVersionTable.PSVersion.Major -ge '5'")
chk_reg = powershell_out!('(Get-ItemProperty -Path Registry::\'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full\').Release')

if !chk_posh.stdout.include?('True')
#elsif!chk_reg.stdout >= '394254'
  include_recipe 'dsc2'
# else
#   Chef::Log.info('WFM 5.0 and .NET 4.6.1 or above are installed, skipping')
# end
end

dsc 'OctopusProjectsDSC' do
  action :install
end
