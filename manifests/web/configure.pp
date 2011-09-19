
class collectd::web::configure (
) {

	Class['collectd::web::install'] -> Class['collectd::web::configure']

	Class['collectd::configure'] -> Class['collectd::web::configure']

}

