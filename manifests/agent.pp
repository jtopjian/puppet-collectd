
class collectd::agent (
	$address,
	$port = $collectd::params::port,
	$username,
	$password
) inherits collectd::params {

	class { 'collectd::configure' :
		forward_address => $address,
		forward_port => $port,
		network_username => $username,
		network_password => $password,
	}

	include collectd::service

	Class['collectd::install'] -> Class['collectd::agent']

}
