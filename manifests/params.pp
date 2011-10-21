
class collectd::params {

	#
	# Packages
	#

	$packages = $operatingsystem ? {
		debian => ['libgcrypt11', 'collectd-core', 'libcurl3-gnutls'],
		freebsd => ['libgcrypt', 'collectd'],
	}

	#
	# Configuration file locations
	#

	$collectd_conf = "/etc/collectd/collectd.conf"

	$collection_conf = "/etc/collectd/collection.conf"

	$filters_conf = "/etc/collectd/filters.conf"

	$thresholds_conf = "/etc/collectd/thresholds.conf"

	$password_file = "/etc/collectd/passwd"

	#
	# Default parameters
	#

	$plugins = [syslog, cpu, df, disk, entropy, interface, load, memory, process, swap, uptime, users, vmem]

	$port = 25826

}
