# Manifest that kills a process "killmenow"

exec { 'kill_killmenow_process':
  command => '/usr/bin/pkill killmenow',
  path => ['.'],
  refreshonly => true,
}
