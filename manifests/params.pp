# Class: collectd::params
#
# Determine default values for collectd parameters
#
class collectd::params {

  # Packages
  case $::osfamily {
    'Debian': {
      $collectd_package  = 'collectd-core'
      $collectd_service  = 'collectd'
    }

    'FreeBSD': {
      $collectd_package = 'collectd'
      $collectd_service = 'collectd'
    }
  }

  # Configuration file locations
  $collectd_conf   = '/etc/collectd/collectd.conf'
  $collection_conf = '/etc/collectd/collection.conf'
  $filters_conf    = '/etc/collectd/filters.conf'
  $thresholds_conf = '/etc/collectd/thresholds.conf'
  $password_file   = '/etc/collectd/passwd'

  # Settings
  $port           = '25826'
  $mysql_user     = 'dbuser'
  $mysql_password = 'changeme'

  # Default plugins
  $plugins = ['cpu', 'df', 'disk', 'entropy', 'interface', 'load', 'memory', 'swap', 'uptime', 'users', 'vmem']
}
