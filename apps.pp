#$pkglist = ["git", "ncftp","filezilla"]
#package { $pkglist : ensure => installed }


class apps_system {
$pkglist = ["git", "ncftp","filezilla"]
package { $pkglist : ensure => installed }
}

class apps_browser {
case $operatingsystem {
	'RedHat', 'CentOS','Fedora': { $pkglist = ["firefox", "rekonq"] }
	'Debian','Ubuntu': { $pkglist = ["firefox", "rekonq","chromium-browser"]}
	'Gentoo': { $pkglist = ["firefox", "rekonq","chromium"] }
	}
package { $pkglist : ensure => installed }
}


class apps_common {
if tagged(home) {
	$pkglist = ["skrooge","keepassx","vlc","calibre"]
	package { $pkglist : ensure => installed }
}
}
