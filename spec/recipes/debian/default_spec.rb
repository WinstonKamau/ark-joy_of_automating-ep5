require 'spec_helper'

describe 'ark::default' do
  
  context 'when no attributes are specified, on Debian' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', platform_family: 'debian', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'installs necessary packages' do
      expect(chef_run).to install_package('libtool')
      expect(chef_run).to install_package('autoconf')
      expect(chef_run).to install_package('unzip')
      expect(chef_run).to install_package('rsync')
      expect(chef_run).to install_package('make')
      expect(chef_run).to install_package('gcc')
      expect(chef_run).to install_package('autogen')
      expect(chef_run).to install_package('shtool')
      expect(chef_run).to install_package('pkg-config')
    end

  end

end

