class custom_files {
	file { '/home':
   	ensure => 'link',
   	target => '/data/home/',
	}
}
