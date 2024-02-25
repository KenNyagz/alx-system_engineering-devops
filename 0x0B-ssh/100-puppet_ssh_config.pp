# making change to a config file in a remote server using puppet via SSH

# Manifest to configure SSH client

# Install puppetlabs-sshkeys_core module
class { 'sshkeys_core':
  client_package_name => 'openssh-client',
}

# Configure SSH client
ssh::client::config { 'default':
  ensure             => present,
  user               => $::ssh::params::user,
  path               => $::ssh::params::config_file,
  priority           => 10,
  host               => '<remote_server>',
  identity_file      => '/home/<your_username>/.ssh/school',
  password_auth      => 'no',
}

