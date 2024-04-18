# ppt manifest to increase the file descriptior limit of ubuntu server

exec { 'fd_limmit_change':
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin',
  command => sed 's/15/4096/' /etc/default/nginx,
} ->

exec { 'restart_nginx':
  command => 'service nginx restart'
}
