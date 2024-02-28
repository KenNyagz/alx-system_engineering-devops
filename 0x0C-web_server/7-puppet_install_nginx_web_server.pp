# install  nginx package
package { 'nginx':
  ensure => installed,
}

#Define Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Define nginx configuration file
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.conf.erb'),
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Define Nginx default page
file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello World!\n",
  require => Package['nginx'],
}

# Define custom 404
file { '/var/www/html/404.httml':
  ensure  => file,
  content => "Ceci n'est pas une page\n",
  require => Package['nginx'],
}

# Define Nginx default configuration template
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  source  => 'puppet://module/nginx/default.conf',
  require => Package['nginx'],
  notify  => Service['nginx'],
}
