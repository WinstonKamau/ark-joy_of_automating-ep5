require 'spec_helper'

describe 'ark::default' do
    context 'when no attributes are specified, on FreeBSD' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new(platform: 'freebsd', version: '10.2')
      runner.converge(described_recipe)
    end

    it 'installs necessary packages' do
      expect(chef_run).to install_package('libtool')
      expect(chef_run).to install_package('autoconf')
      expect(chef_run).to install_package('unzip')
      expect(chef_run).to install_package('rsync')
      expect(chef_run).to install_package('gmake')
      expect(chef_run).to install_package('gcc')
      expect(chef_run).to install_package('autogen')
      expect(chef_run).to install_package('gtar')
    end

    it "tar binary" do
      attribute = chef_run.node['ark']['tar']
      expect(attribute).to eq '/usr/bin/tar'
    end
  end
end
