RSpec.describe 'chefdk_bootstrap::vagrant' do
  context 'Given a Windows 2012R2 node' do
    cached(:windows_chef_run) do
      ChefSpec::ServerRunner.new(
        platform: 'windows',
        version: '2012R2'
      ) do |node|
        node.set['vagrant']['msi_version'] = '1.7.4'
      end.converge(described_recipe)
    end

    it 'includes the vagrant::windows recipe' do
      expect(windows_chef_run).to include_recipe('vagrant::windows')
    end

    it 'installs Vagrant 1.7.4' do
      expect(windows_chef_run).to install_windows_package('Vagrant 1.7.4')
    end
  end
end
