# Class: collectd::server
#
# Manages the configuration of a collectd collection server.
#
# Parameters:
#   [*address*]  - address the server should listen on.
#   [*port*]     - port the server should listen on.
#   [*username*] - username to authenticate clients.
#   [*password*] - password to authenticate clients.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
#   class { 'collectd::server' :
#       address => "192.268.1.1",
#       username => "anony",
#       password => "mouse",
#   }
#
class collectd::server (
	$address,
	$port = $collectd::params::port,
	$username,
	$password
) inherits collectd::params {

	class { 'collectd::configure' :
		listen_address => $address,
		listen_port => $port,
		network_username => $username,
		network_password => $password,
	}

	include collectd::service

	Class['collectd::install'] -> Class['collectd::server']
  
}
