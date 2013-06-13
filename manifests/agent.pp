#
# == Class
#
# collectd::agent
#
# Manages the configuration of a collectd collection agent.
#
# == Parameters
#
#  [*address*]  - address of the server to send to.
#  [*port*]     - port the server is listening on.
#  [*username*] - username to authenticate to the server.
#  [*password*] - password to authenticate to the server.
#
# == Sample Usage
#
#   class { 'collectd::agent' :
#       address => "192.268.1.1",
#       username => "anony",
#       password => "mouse",
#   }

class collectd::agent (
  $address,
  $username,
  $password,
  $port = $::collectd::params::port
) inherits collectd::params {
  class { 'collectd::configure':
    forward_address  => $address,
    forward_port     => $port,
    network_username => $username,
    network_password => $password,
  }
}
