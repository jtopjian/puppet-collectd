class { 'collectd': }
class { 'collectd::server': 
  address  => '192.168.1.1',
  username => 'foo',
  password => 'bar',
}

include collectd::plugin
include collectd::params
collectd::plugin::enable {
  $collectd::params::plugins:
}
