# Install Flask (+dependencies)

package { 'Flask':
  ensure   => '2.1.0',
  provider => 'gem',
}

