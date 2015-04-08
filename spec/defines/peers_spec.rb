require 'spec_helper'

describe 'haproxy::peers' do
  let(:facts) {{ :ipaddress => '1.1.1.1' }}

  context "when no options are passed" do
    let(:title) { 'bar' }

    it { should contain_datacat_fragment('bar_peers_block').with(
      'target'  => '/etc/haproxy/haproxy.cfg',
      'data'    => {
        'peers' => {
          'bar' => {
            'config'  => "\npeers bar\n",
            'members' => [],
          },
        },
      }
    ) }
  end
end
