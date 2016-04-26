name             'dsc2'
maintainer       'Dimension Data Cloud Solutions, Inc.'
maintainer_email 'eugene.narciso@itaas.dimensiondata.com'
license          'Apache 2.0'
description      'Installs dsc modules'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

supports         'windows', '>= 6.3'

source_url       'https://github.com/DimensionDataDevOps/cookbook-dsc2' if respond_to?(:source_url)
issues_url       'https://github.com/DimensionDataDevOps/cookbook-dsc2/issues' if respond_to?(:issues_url)

depends          'windows', '~> 1.39.2'
depends          'powershell', '~> 3.2.3'
depends          'ms_dotnet', '~> 2.6.1'
