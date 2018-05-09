require 'chefspec'
require 'chefspec/berkshelf'
require 'pry'

at_exit { ChefSpec::Coverage.report! }

shared_examples 'installs necessary packages' do
    it 'installs necessary packages' do
      packages.each do |package_name|
        expect(chef_run).to install_package(package_name)
      end
    end  
  end
