class seteam::master {
  include seteam::master::puppet
  include seteam::master::puppetdb

  # Puppet master firewall rules
  Firewall {
    chain  => 'INPUT',
    proto  => 'tcp',
    action => 'accept',
  }
  firewall { '110 puppetmaster allow all':
    dport  => '8140',
  }
  firewall { '110 dashboard allow all':
    dport  => '443',
  }
  firewall { '110 mcollective allow all':
    dport  => '61613'
  }

}
