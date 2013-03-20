class virt_groups {
	@group { "local": 
	gid => "10000",
	ensure => present
	}
}

class virt_users {
	@user { 
	"pierre": ensure => "present",
	uid => "10705",
	gid => "local",
	comment => "Pierre",
	home => "/home/pierre",
	shell => "/bin/bash",
	}
	@user { 
	"test": ensure => "present",
	uid => "20000",
	gid => "local",
	comment => "Test User",
	home => "/home/test",
	shell => "/bin/bash",
	}
}

class custom_users {
	include virt_users, virt_groups
	realize(
		Group["local"],
		User["pierre"],
		User["test"],
	)
}

