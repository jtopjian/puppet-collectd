
class collectd::agent (
  $address,
  $port = "25826",
  $username,
  $password
) {

  class { 'collectd::configure' :
    forward_address => $address,
    forward_port => $port,
    network_username => $username,
    network_password => $password,
  }

  Class['collectd::install'] -> Class['collectd::agent']

}
