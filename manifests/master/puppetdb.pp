class seteam::master::puppetdb {
  include seteam

  class { 'puppetdb::server':
    database => 'embedded',
    require  => Class['seteam'],
  }

  class { 'puppetdb::master::config':
    require                  => Class['puppetdb::server'],
    puppetdb_startup_timeout => '120',
  }

  # Set a default listen_port (companion to ssl_listen_port)
  # A more elegant way to do this would be to patch the puppetdb
  # module to set it in puppetdb::server::jetty_ini
  include puppetdb::params
  ini_setting {'puppetdb_host':
    ensure  => present,
    path    => "${puppetdb::params::confdir}/jetty.ini",
    section => 'jetty',
    setting => 'host',
    value   => $puppetdb::params::ssl_listen_address,
    notify  => Service[$puppetdb::params::puppetdb_service],
  }

}
