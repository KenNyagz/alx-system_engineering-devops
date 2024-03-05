# Configuring haproxy load balancer

package { 'nginx':
  ensure => 'installed',
}

file { '/etc/nginx/conf.d/custom_http_header.conf':
  ensure  => present,
  content => "add_header X-Served-By $::hostname;",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure    => 'running',
  enanble   => true,
  subscribe => File['/etc/nginx/conf.d/custom_http_header.conf'],
}
