# Debug wordpress running on apache with php

exec { 'typo_fix':
  command => "sed -i 's/phpp/php/' /var/www/html/wp-settings.php",
}
