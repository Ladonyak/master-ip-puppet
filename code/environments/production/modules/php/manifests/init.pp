class php {

  package { 'php':
    name => $phpname,
    ensure => present,
  }

  package { 'php-pear':
    ensure => present,
  }

}
