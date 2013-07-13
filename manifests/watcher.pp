define incron::watcher (
  $ensure = present,
  $loction,
  $mask,
  $action
) {

  include incron

  file { "/etc/incron.d/${name}":
    ensure  => "${ensure}",
    content => "${location} ${mask} ${action}",
    require => Package['incron'],
    notify  => Service['incrond'];
  }
}