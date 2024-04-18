# ppt manifest to add user and give root permission

exec { 'add_user':
  command => 'sudo adduser holberton; usermod -aG root holberton',
  path    => '/usr/sbin:/usr/local/bin:/usr/local/sbin'
}
