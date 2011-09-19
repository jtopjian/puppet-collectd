class collectd::web::install {

	package { ['librrds-perl', 'libconfig-general-perl', 'libhtml-parser-perl', 'libregexp-common-perl', 'libjson-perl'] :
		ensure => installed,
	}

}
