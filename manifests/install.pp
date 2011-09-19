class collectd::install {

	package { libgcrypt11 :
		ensure => installed,
	}

	package { collectd-core :
		ensure => installed,
		require => Package['libgcrypt11'],
	}

}
