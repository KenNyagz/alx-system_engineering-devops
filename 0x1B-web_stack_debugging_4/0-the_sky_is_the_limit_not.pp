# ppt manifest to increase the file descriptior limit of ubuntu server

exec { 'fd_limit_change':
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin',
  command => "sed -i 's/15/4096/' /etc/default/nginx; service nginx restart",
  onlyif  => 'test -e /etc/default/nginx',
}
