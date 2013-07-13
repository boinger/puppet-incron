define incron::watcher($ensure = present, $location, $mask, $action) {

  include incron

  file { "/etc/incron.d/${name}":
    ensure  => "${ensure}",
    content => "${location} ${mask} ${action}",
    require => Package['incron'],
    notify  => Service['incrond'];
  }
}