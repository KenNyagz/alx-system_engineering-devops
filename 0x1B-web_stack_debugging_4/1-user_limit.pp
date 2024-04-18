# ppt manifest to add user and give root permission

exec { 'fix_user_limit':
  command => 'sed -i "s/[0-9]/&00/" /etc/security/limits.conf',
  path    => '/usr/sbin:/usr/local/bin:/usr/local/sbin'
}
