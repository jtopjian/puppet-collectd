# Class to configure collectd
class collectd::configure (
  $collectd_conf    = $collectd::params::collectd_conf,
  $collection_conf  = $collectd::params::collection_conf,
  $filters_conf     = $collectd::params::filters_conf,
  $thresholds_conf  = $collectd::params::thresholds_conf,
  $password_file    = $collectd::params::password_file,
  $plugins          = $collectd::params::plugins,
  $mysql_user       = $collectd::params::mysql_user,
  $mysql_password   = $collectd::params::mysql_password,
  $listen_address   = '',
  $listen_port      = '',
  $forward_address  = '',
  $forward_port     = '',
  $network_username,
  $network_password
) inherits collectd::params {

  # file concat support
  include concat::setup

  # Set dependencies on all files
  File {
    require => Package[$collectd::params::collectd_package],
    notify  => Service[$collectd::params::collectd_service],
  }

  # Configuration derived from the parameters above
  $enable_network = ("$listen_address$forward_address" != "")

  concat { $collectd_conf:
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  # Enable the network plugin
  if $enable_network {
    concat::fragment { 'collectd_network':
      target  => $collectd_conf,
      content => template('collectd/plugins/network.erb'),
      order   => 01,
    }
  }

  file { $collection_conf :
    ensure  => file,
    content => template('collectd/collection.conf.erb'),
  }

  file { $filters_conf :
    ensure  => file,
    content => template('collectd/filters.conf.erb'),
  }

  file { $thresholds_conf :
    ensure  => file,
    content => template('collectd/thresholds.conf.erb'),
  }

  if ($listen_address) {
    file { $password_file:
      ensure  => file,
      content => "$network_username:$network_password\n",
    }
  }
}
