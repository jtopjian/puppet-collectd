
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
