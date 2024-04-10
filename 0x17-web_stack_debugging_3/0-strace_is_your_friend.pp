# Debug apache
$apache_pid = pgrep -f httpd

class apache {
    package { 'apache2':
        ensure => installed,
    }

    service { 'apache2':
        ensure  => running,
        enable  => true,
        require => Package['apache2'],
    }

    # You can manage Apache configuration files here
    # For example, you might ensure the correct settings are in httpd.conf
    file { '/etc/apache2/httpd.conf':
        ensure  => file,
        content => template('apache/httpd.conf.erb'),
        require => Package['apache2'],
        notify  => Service['apache2'],
    }
}
