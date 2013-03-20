include perm_syslog
class perm_syslog {
case $operatingsystem {
	'RedHat', 'CentOS','Fedora','Gentoo','Debian': {
	$message_file = "/var/log/messages"
	}
	'Ubuntu': {
	$message_file = "/var/log/syslog"
	}
}
file { "$message_file" :
	ensure => present, 
	group => "admin",
}
file { "/tmp/test" :
	ensure => present, 
	group => "admin",  
}

}

