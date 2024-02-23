# installing flask from pip3

exec { 'upgrade_werkzeug':
  command     => '/usr/bin/pip3 install --upgrade werkzeug',
  path        => '/usr/local/bin:/usr/bin:/bin',
  refreshonly => true,
}

package { 'Flask':
  ensure   => '2.0.3',
  provider => 'pip3',
  require  => Exec['upgrade_werkzeug'],
}

exec { 'print_versions':
  command   => 'flask --version',
  path      => '/usr/local/bin:/usr/bin:/bin',
  logoutput => true,
  require   => Package['Flask'],
}
