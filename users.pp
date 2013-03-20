
class virt_groups {
	@group { "local": 
	ensure => present,
	gid => "local",
	}
}

class virt_user::define {
	@user { "test": 
	ensure => "present",
	uid => "20000",
	gid => "local",
	comment => "Test Puppet User",
	home => "/home/test",
	shell => "/bin/bash",
	}
	@user { 
	"pierre": ensure => "present",
	uid => "10705",
	gid => "local",
	comment => "Pierre",
	home => "/home/pierre",
	shell => "/bin/bash",
	}
        @user {
        "nimda": ensure => "present",
        uid => "10001",
        gid => "local",
        comment => "Admin user",
        home => "/home/nimda",
        shell => "/bin/bash",
        }

}

class virt_user::admin inherits virt_user::define {
	include virt_groups, sudo_group
	User["pierre"] {groups +> "$sudo_group"}
	User["nimda"] {groups +> "$sudo_group"}
	realize(
		Group["local"],
		User["pierre"],
		User["nimda"],
	)
}

class virt_user::common inherits virt_user::define {
	include virt_groups
	realize(
		Group["local"],
		User["test"],
	)
}


class sudo_group {
  case $operatingsystem {
    'RedHat', 'CentOS','Fedora','Gentoo': {
      $sudo_group = "wheel"
    }
    'Debian','Ubuntu': {
      $sudo_group = "sudo"
    }
  }
}

