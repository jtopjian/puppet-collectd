
class collectd::configure (
	$collectd_conf = $collectd::params::collectd_conf,
	$collection_conf = $collectd::params::collection_conf,
	$filters_conf = $collectd::params::filters_conf,
	$thresholds_conf = $collectd::params::thresholds_conf
) inherits collectd::params {

	file { $collectd_conf :
		ensure => file,
		#content => template('collectd/collectd.conf.erb'),
	}

	file { $collection_conf :
		ensure => file,
		#content => template('collectd/collection.conf.erb'),
	}

	file { $filters_conf :
		ensure => file,
		#content => template('collectd/filters.conf.erb'),
	}

	file { $thresholds_conf :
		ensure => file,
		#content => template('collectd/thresholds.conf.erb'),
	}

}

