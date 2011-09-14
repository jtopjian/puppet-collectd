class collectd::install {

	package { collectd-core :
		ensure => installed,
	}

}
