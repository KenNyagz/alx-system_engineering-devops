# making change to a config file in a remote server using puppet via SSH

file { '/root/.ssh/config':
  ensure => 'present',
  content => "
Host ubuntu
    IdentifyFile ~/.ssh/school
    PasswordAuthentication no
",
}
