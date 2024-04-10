class apache_fix {
  file { '/etc/httpd/conf/httpd.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('apache/httpd.conf.erb'),
    notify  => Service['httpd'],
  }

  service { 'httpd':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/httpd/conf/httpd.conf'],
  }
}

