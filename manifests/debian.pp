class seteam::debian {
  include ntp

  apt::source { 'puppetlabs-products':
    location   => 'http://apt.puppetlabs.com',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }

  apt::source { 'puppetlabs-enterprise':
    location   => 'http://apt-enterprise.puppetlabs.com',
    repos      => 'extras',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }

}
