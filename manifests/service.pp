class collectd::service {

	service { 'collectd' :
		enable => true,
		ensure => running,
		hasstatus => true,
		hasrestart => true,
	}

}

