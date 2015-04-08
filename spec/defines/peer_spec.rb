require 'spec_helper'

describe 'haproxy::peer' do
  let(:title) { 'dero' }
  let(:facts) do
    {
      :ipaddress => '1.1.1.1',
      :hostname  => 'dero',
    }
  end

  context 'with a single peer' do
    let(:params) do
      {
        :peers_name => 'tyler',
        :port       => 1024,
      }
    end

    it { should contain_datacat_fragment('peers-tyler-dero').with(
      'target'  => '/etc/haproxy/haproxy.cfg',
      'data' => {
        'peers' => {
          'tyler' => {
            'members' => ["  peer dero 1.1.1.1:1024\n"],
          },
        },
      },
    ) }
  end
end
