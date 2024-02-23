# Install Flask (+dependencies)

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'gem',
}

<<<<<<< HEAD
exec { 'print_versions':
  command => 'flask --version',
  path    => ['/usr/local/bin', '/usr/bin', '/bin'],
  logoutput => true,
  require => Package['Flask'],
}
=======
>>>>>>> 41f08e5e3eb5406b088bf62625ad75b66c7d7a2c
