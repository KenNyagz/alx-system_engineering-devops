# installing flask from pip3

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

exec { 'print_versions':
  command => 'flask --version',
  path    => ['/usr/local/bin', '/usr/bin', '/bin'],
  logoutput => true,
  require => Package['Flask'],
}
