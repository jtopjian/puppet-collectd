# Collectd 
# 
# Requires
#  Class['concat']
class collectd inherits collectd::params {

  # Install collectd dependencies
  package { $collectd::params::dependencies:
    ensure => installed,
    before => Package[$collectd::params::collectd_package],
  }

  # Install the main collectd package
  package { $collectd::params::collectd_package:
    ensure => installed,
  }

  # Set up the collectd service
  service { $collectd::params::collectd_service:
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    subscribe  => Class['collectd::configure'],
    require    => Package[$collectd::params::collectd_package],
  }
}
