# making change to a config file in a remote server using puppet via SSH

file { '/etc/ssh/ssh_config.d/myconfig.conf':
  ensure  => file,
  mode    => '0600',
  content => "Host *\n    PubkeyAuthentication yes\n    PasswordAuthentication no\n    IdentityFile ~/.ssh/school\n",
}
