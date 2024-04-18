# ppt manifest to fix a user's file permission limit

exec { 'increase_soft_file':
  path    => '/usr/local/bin/:/bin/'
  command => 'sed -i "/holberton soft/s/4/20000/" /etc/security/limits.conf',
}

exec { 'fix_limit_hbton_user':
  path    => '/usr/local/bin/:/bin/'
  command => 'sed -i "/holberton hard/s/5/10000/" /etc/security/limits.conf',
}
