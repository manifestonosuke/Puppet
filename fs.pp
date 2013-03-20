class custom_mounts {
	$mountdir = "/data"
	if tagged(work) {
	$device = "/dev/sda2"
	}
	if tagged(home) {
        $device = "/dev/sda4"
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
