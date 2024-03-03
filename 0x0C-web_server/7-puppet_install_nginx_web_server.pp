# install  nginx package
package { 'nginx':
  ensure => installed,
}

file_line { 'install':
  ensure  => 'present',
  path    => '/etc/nginx/sites-enabled/default',
  after   => 'listen 80 default_server;',
  line    => 'rewrite ^/redirect_me https://github.com/KenNyagz permanent;',
}

#Define Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

# Define Nginx default page
file { '/var/www/html/index.html':
  ensure  => 'present',
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
