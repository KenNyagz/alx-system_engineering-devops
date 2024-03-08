# Configuring haproxy load balancer

class nginx_custom_header {
  # Ensure Nginx is installed
  package { 'nginx':
    ensure => installed,
  }->

  # Manage the Nginx configuration to include the custom header
  file { '/etc/nginx/conf.d/custom_header.conf':
    ensure  => file,
    content => epp('nginx_custom_header/custom_header.epp'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }->

  # Ensure the Nginx service is running and enabled
  service { 'nginx':
    ensure => running,
    enable => true,
    require => File['/etc/nginx/conf.d/custom_header.conf'],
  }
}

include nginx_custom_header
