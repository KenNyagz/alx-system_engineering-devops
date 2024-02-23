class flask_installation(
  $flask_version = '2.1.0',
){
  package { 'python3-pip':
    ensure => installed,
  }

  exec { "pip3 install flask==${flask_version}":
    require => Package['python3-pip'],
    path => '/usr/bin:/usr/sbin:/bin:/sbin',
  }
}
