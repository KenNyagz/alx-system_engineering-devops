# Ensure Apache service is running
service { 'apache2':
  ensure => 'running',
}

# Define file resource to manage Apache configuration file
file { '/etc/apache2/apache2.conf':
  ensure  => file,
  content => template('my_module/apache2.conf.erb'),
  notify  => Service['apache2'], # Restart Apache if the config changes
}
