# Install Flask (+dependencies)

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

package { "Werzeug":
  ensure => '2.1.1',
  provider => 'pip3',
}
