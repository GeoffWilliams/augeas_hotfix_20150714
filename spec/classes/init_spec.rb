require 'spec_helper'
describe 'augeas_hotfix_20150714' do

  context 'with defaults for all parameters' do
    it { should contain_class('augeas_hotfix_20150714') }
  end

  context 'lens is installed' do
    it { should contain_file('/opt/puppet/share/augeas/lenses/dist/tests/test_sudoers.aug').with(
        'ensure' => 'file',
        'source' => 'puppet:///modules/augeas_hotfix_20150714/test_sudoers.aug',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644'
    )}

    it { should contain_file('/opt/puppet/share/augeas/lenses/dist/sudoers.aug').with(
        'ensure' => 'file',
        'source' => 'puppet:///modules/augeas_hotfix_20150714/sudoers.aug',
        'owner'  => 'root',
        'group'  => 'root',
        'mode'   => '0644'
    )}
  end
end
