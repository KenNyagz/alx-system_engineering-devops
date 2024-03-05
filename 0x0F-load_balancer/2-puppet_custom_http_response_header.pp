# 2-puppet_custom_http_response_header.pp

# Ensure Nginx is installed
include nginx

# Define the custom HTTP header
$custom_header = "X-Served-By: ${fqdn}"

# Create a new server block
nginx::resource::server { 'custom_header_server':
  ensure => present,
  listen => '80',
  server_name => 'localhost',
  location => {
    '/' => {
      proxy_pass => 'http://localhost:8000',
      proxy_set_header => {
        'Host' => $fqdn,
        'X-Served-By' => $custom_header,
      },
    },
  },
}
