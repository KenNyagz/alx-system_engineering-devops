# apache debugging
module apache_strace {
  class apache_strace (
    $strace_options = '-p 8181 -o /tmp/strace.log -s 200 -ff'
  ) {
    # This class installs and configures strace to monitor Apache processes

    # The strace options to use when monitoring Apache processes
    $strace_options

    # Ensure that strace is installed
    package { 'strace':
      ensure => present,
    }

    # Create a script to run strace on Apache processes
    file { '/usr/local/bin/strace_apache.sh':
      ensure  => file,
      mode    => '0755',
      content => template('apache_strace/strace_apache.sh.erb'),
    }

    # Schedule a cron job to run the script periodically
    cron { 'strace_apache':
      ensure  => present,
      user    => 'root',
      command => '/usr/local/bin/strace_apache.sh',
      minute  => '0',
      hour    => '2',
    }
  }

  # Ensure that the apache_strace class is always loaded
  Class['apache_strace'] -> File['/etc/cron.d/strace_apache']
}
