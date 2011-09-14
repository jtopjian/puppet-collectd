
class collectd::configure (
	$collectd_conf = "/etc/collectd/collectd.conf",
	$collection_conf = "/etc/collectd/collection.conf",
	$filters_conf = "/etc/collectd/filters.conf",
	$thresholds_conf = "/etc/collectd/thresholds.conf"

) {
	file { $collectd_conf :
		ensure => file,
		content => template('collectd/collectd.conf.erb'),
	}

	file { $collection_conf :
		ensure => file,
		content => template('collectd/collection.conf.erb'),
	}

	file { $filters_conf :
		ensure => file,
		content => template('collectd/filters.conf.erb'),
	}

	file { $thresholds_conf :
		ensure => file,
		content => template('collectd/thresholds.conf.erb'),
	}

}

