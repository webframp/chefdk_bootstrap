RSpec.describe 'chefdk_bootstrap::git' do
  context 'On a Windows machine' do
    include_context 'windows_2012'

    it 'installs the correct version of Git' do
      pending('Waiting on chocolatey_package matchers in ChefSpec 4.6')
      expect(windows_chef_run).to install_chocolatey_package('git')
    end

    it 'installs the Git credential helper' do
      pending('Waiting on chocolatey_package matchers in ChefSpec 4.6')
      expect(windows_chef_run).to install_chocolatey_package('git-credential-manager-for-windows')
    end

    it 'installs poshgit' do
      pending('Waiting on chocolatey_package matchers in ChefSpec 4.6')
      expect(windows_chef_run).to install_chocolatey_package('poshgit')
    end
  end

  context 'On a Mac' do
    include_context 'mac_os_x'

    it 'installs the latest git package' do
      expect(mac_os_x_chef_run).to install_package('git')
    end
  end
end
