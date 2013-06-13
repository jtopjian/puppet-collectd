Puppet module for collectd
==========================

This is a [Puppet][1] module to configure and manage [collectd][2], a system to
collect, aggregate and store system statistics.

This module is based off of Thomas Sutton's [original][3].

Right now it has only been tested in a server/agent config, but standalone should
work fine, too.

Example Roles
-------------

### Server

```puppet
class admin::collectd::server (
  $ip_address,
  $username,
  $password
) {

  include ::collectd::plugin
  include ::collectd::params

  class { '::collectd': }
  class { '::collectd::server':
    address  => $ip_address,
    username => $username,
    password => $password,
  }

  ::collectd::plugin::enable { 'rrdtool': }
  ::collectd::plugin::enable { $::collectd::params::plugins: }

}
```

### Agent

```puppet
class admin::collectd::agent (
  $ip_address,
  $username,
  $password
) {

  include ::collectd::plugin
  include ::collectd::params

  class { '::collectd': }
  class { '::collectd::agent':
    address  => $ip_address,
    username => $username,
    password => $password,
  }

  ::collectd::plugin::enable { 'rrdtool': }
  ::collectd::plugin::enable { $::collectd::params::plugins: }

}
```

### Applying the Roles

```puppet
node 'collectd.example.com' {
  class { 'admin::collectd::server':
    ip_address => hiera('private_ip'),
    username   => hiera('collectd_username'),
    password   => hiera('collectd_password'),
  }
}

node 'server-01.example.com' {
  class { 'admin::collectd::agent':
    ip_address => hiera('cloud_private_ip'),
    username   => hiera('collectd_username'),
    password   => hiera('collectd_password'),
  }

  # libvirt collectd plugin
  include collectd::plugin
  collectd::plugin::enable { 'libvirt':
    config_hash => {
      'Connection'      => 'qemu:///system',
      'RefreshInterval' => 60,
      'HostnameFormat'  => "name"
    }
  }
}
```

ToDo
----

* Make plugins more customizable
* Tie into a web front-end


[1]: http://puppetlabs.com/puppet/introduction/
[2]: http://collectd.org/
[3]: https://github.com/thsutton/puppet-collectd
