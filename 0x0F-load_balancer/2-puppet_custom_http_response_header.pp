# Configuring haproxy load balancer

package { 'nginx':
  ensure => 'installed',
}

file { '/etc/nginx/conf.d/custom_http_header.conf':
  ensure  => present,
  content => "server_tokens off;\nadd_header X-Served_By ${::hostname};\n",
  notify  => service['nginx'],
}

service { 'nginx':
  ensure  => running,
  enanble => true,
  subscribe => File['/etc/nginx/conf.d/custom_http_header.conf'],
}
