Puppet module for collectd
==========================

This is a [Puppet][1] module to configure and manage [collectd][2], a system to 
collect, aggregate and store system statistics. You can configure collectd in
three basic modes:

This module is based off of Thomas Sutton's [original][3].

Right now it has only been tested in a server/agent config, but standalone should
work fine, too.

Example configs
---------------

### Server

    class admin::collectd-server (
      $ip_address,
      $username,
      $password
    ) {
      class { 'collectd': }
      class { 'collectd::server': 
        address  => $ip_address,
        username => $username,
        password => $password,
      }
    
      include collectd::plugin
      include collectd::params
      collectd::plugin::enable { 'rrdtool': }
      collectd::plugin::enable {
        $collectd::params::plugins:
      }
    }

### Agent

    class admin::collectd-agent (
      $ip_address,
      $username,
      $password
    ) {
      class { 'collectd': }
      class { 'collectd::agent': 
        address  => $ip_address,
        username => $username,
        password => $password,
      }
    
      include collectd::plugin
      include collectd::params
      collectd::plugin::enable {
        $collectd::params::plugins:
      }
    }

ToDo
----

* Make plugins more customizable
* Tie into a web front-end


[1]: http://puppetlabs.com/puppet/introduction/
[2]: http://collectd.org/
[3]: https://github.com/thsutton/puppet-collectd
