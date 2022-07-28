node 'puppetagent' {
  $adminemail = 'webmaster@example.com'
  $servername = 'agent-ip-172-31-95-61'

  include apache
  include apache::vhosts
  include mysql::server
  include php


  }

node 'centoshost.example.com' {
  $adminemail = 'webmaster@example.com'
  $servername = 'hostname.example.com'

  include accounts
  include apache
  include apache::vhosts

  resources { 'firewall':
    purge => true,
  }

  Firewall {
    before        => Class['firewall::post'],
    require       => Class['firewall::pre'],
  }

  class { ['firewall::pre', 'firewall::post']: }

  }
