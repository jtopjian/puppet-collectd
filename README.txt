Puppet module for collectd
==========================

This is a [Puppet][1] module to configure and manage [collectd][2], a system to 
collect, aggregate and store system statistics. You can configure collectd in
three basic modes:

1. Stand-alone -- where the host monitors only itself.

2. Server -- where the host also accepts data from other hosts.

3. Agent -- where the host also sends its data to another host.

Each of the three modes is easy to configure. For stand-alone operation, just 
include the class:

    include collectd

To operate a server, first include the configuration:

    class { 'collectd::server' :
    	  address => '192.128.1.1',
	      port => '25826', # optional
	      username => 'myusername',
	      password => 'asecret',
    }
    include collectd

Configuring an agent is almost identical:

    class { 'collectd::agent' :
    	  address => '192.128.1.1',
        port => '25826', # optional
        username => 'myusername',
        password => 'asecret',
    }
    include collectd

There are number of rather annoying limitations which will be fixed in future
revisions to this module. In no particular order:

* Should be able to control activation of individual plugins.

* Should support unique agent usernames and passwords.

* Should be sure to set permissions on various files correctly (especially the
  files that contain authentication details).

* Should include configuration for [collect-web][3] (a start is available in a
  [branch][4]).

[1]: http://puppetlabs.com/puppet/introduction/
[2]: http://collectd.org/
[3]: https://github.com/httpdss/collectd-web/
[4]: https://github.com/thsutton/puppet-collectd/tree/feature-web/
