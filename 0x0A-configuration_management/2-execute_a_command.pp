# Manifest that kills a process "killmenow"

exec { 'killmenow':
  command  => 'pkill -f killmenow',
  onlyif   => 'pgrep -f killmenow',
}
