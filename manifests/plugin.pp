# Defines a resource that enables plugins:
# 
#   collectd::plugin::enable { 'cpu': }
#
# At the moment, plugins can not be configured,
# but this will change soon:
#
#   collectd::plugin::enable { 'disk': 
#     config_hash => $config_hash,
#   }

class collectd::plugin inherits collectd::params {
  include concat::setup

  define enable (
    $config_hash = undef
  ) {
    concat::fragment { $name:
      target  => $collectd::params::collectd_conf,
      content => template("collectd/plugins/${name}.erb"),
      order   => 05,
    }
  }
}
