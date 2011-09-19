class collectd::service inherits collectd::params {

	service { 'collectd' :
		enable => true,
		ensure => running,
		hasstatus => true,
		hasrestart => true,
	}

}

