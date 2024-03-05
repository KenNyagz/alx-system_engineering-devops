# Configuring haproxy load balancer

class nginx_custom_header {
  package { 'nginx':
    ensure => 'installed',
  }

  file { '/etc/nginx/conf.d/custom_http_header.conf':
    ensure  => 'file',
    content => "add_header X-Served-By $hostname;",
    require => Package['nginx'],
    notify  => service['nginx'],
  }

  service { 'nginx':
    ensure    => 'running',
    enanble   => true,
    subscribe => File['/etc/nginx/conf.d/custom_http_header.conf'],
  }

include nginx_custom_header
