# == Class
#
# collectd
#
# == Requires
#
# Class['concat']
#
class collectd inherits collectd::params {

  # Install the main collectd package
  package { $::collectd::params::collectd_package:
    ensure => installed,
  }

  # Set up the collectd service
  service { $::collectd::params::collectd_service:
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    subscribe  => Class['collectd::configure'],
    require    => Package[$::collectd::params::collectd_package],
  }
}
