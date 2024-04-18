# ppt manifest to increase the file descriptior limit of ubuntu server

exec { "fd_limmit_change":
  path    => '/usr/bin, /usr/sbin, /usr/local/bin',
  command => sed "s/15/4096/" /etc/default/nginx,
  command => "service nginx restart"
}
