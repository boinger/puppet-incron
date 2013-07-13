## Usage:
##  incron::watcher {
##    'soap_inputDir':
##      location => '/home/mule/inputDir',
##      mask     => 'IN_CREATE',
##      action   => 'runuser - filemover -c \'scp -p $@ destination.example.com:/data/dump/\'';
##   }

define incron::watcher($ensure = present, $location, $mask, $action) {

  include incron

  file { "/etc/incron.d/${name}":
    ensure  => "${ensure}",
    content => "${location} ${mask} ${action}",
    require => Package['incron'],
    notify  => Service['incrond'];
  }
}