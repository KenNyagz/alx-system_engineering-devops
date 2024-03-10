# Configuring haproxy load balancer

# Install nginx package
package { 'nginx':
  ensure => installed,
}

# Define the custom HTTP header
$server_hostname = $facts['hostname']
$custom_header = "add_header X-Served-By '${server_hostname}';"

# Configure nginx
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('path/to/nginx_template.erb'), # Path to a template file for nginx configuration
  notify  => Service['nginx'],
}

# Ensure nginx service is running and enabled
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => File['/etc/nginx/sites-available/default'],
}
