
class collectd::server (
  $address,
  $port="25826",
  $username,
  $password
) {

  class { 'collectd::configure' :
    listen_address => $address,
    listen_port => $port,
    network_username => $username,
    network_password => $password,
  }

  include collectd::service

  Class['collectd::install'] -> Class['collectd::server']
  
}
