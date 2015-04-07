define haproxy::peer (
  $peers_name,
  $port,
  $ensure       = 'present',
  $server_names = $::hostname,
  $ipaddresses  = $::ipaddress,
) {

  # Templats uses $ipaddresses, $server_name, $ports, $option
# concat::fragment { "peers-${peers_name}-${name}":
#   ensure  => $ensure,
#   order   => "30-peers-01-${peers_name}-${name}",
#   target  => '/etc/haproxy/haproxy.cfg',
#   content => template('haproxy/haproxy_peer.erb'),
# }

  datacat_fragment { "peers-${peers_name}-${name}":
    target => $haproxy::config_file,
    data   => {
      'peers' => {
        "${peers_name}" => {
          'members'  => [template("${module_name}/haproxy_peer.erb")],
        }
      }
    },
  }
}
