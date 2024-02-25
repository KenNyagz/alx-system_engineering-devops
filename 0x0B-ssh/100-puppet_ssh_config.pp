#!/usr/bin/env bash
# making change to a config file in a remote server using puppet via SSH

file { '/etc/ssh/ssh_config':
  ensure => present,
  content =>"

          # client config
          host *
          IdentifyFile ~/.ssh/school
          PasswordAuthentication no
          ",
} 
