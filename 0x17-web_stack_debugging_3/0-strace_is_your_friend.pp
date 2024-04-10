$apache_pid = pgrep -f httpd

module apache_strace {
  class apache_strace {
    file { '/usr/local/bin/strace_apache.sh':
      ensure => file,
      mode   => '0755',
      source => 'puppet:///modules/apache_strace/strace_apache.sh',
    }

    cron { 'strace_apache':
      ensure  => present,
      user    => 'root',
      command => '/usr/local/bin/strace_apache.sh',
      hour    => '2',
      minute  => '0',
    }
  }
}
