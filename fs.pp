class custom_mounts {
	$mountdir = "/data"
	$device = "/dev/sda4"
	if tagged(work) {
	$device = "/dev/sda2"
	}

	file { "$mountdir":
    	ensure => "directory",
    	owner  => "root",
    	group  => "adm",
    	mode   => 755,
	}

	mount { "$mountdir":
        device  => "$device",
        fstype  => "ext4",
	ensure  => "mounted",
	options => "defaults",
        atboot  => "true",
    	}
}
