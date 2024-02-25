# making change to a config file in a remote server using puppet via SSH

ssh_config { 'mycofig':
  ensure => present,
  identityfile => '~/.ssh/school',
  passwordauthentication => false,
  pubkeyauthentication => true,
}
