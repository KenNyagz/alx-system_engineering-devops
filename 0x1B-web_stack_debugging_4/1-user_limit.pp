# ppt manifest to fix a user's file permission limit

exec { 'fix_user_limit':
  command => 'sed -i "/holberton/s/[0-9]/&00/" /etc/security/limits.conf',
  path    => ['/usr/sbin', '/usr/local/bin', '/usr/local/sbin'],
  # path    => '/usr/sbin/:/usr/local/bin/:/usr/local/sbin/',
}
