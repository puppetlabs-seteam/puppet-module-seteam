class seteam::master::bootstrap {
  include seteam

  $set_certname = generate('/bin/sh', '-c', '/bin/sed -n "s/ *certname *= *\(.*\)/\1/p1" /etc/puppetlabs/puppet/puppet.conf | head -n 1')
  $chomp_certname = regsubst($set_certname, '\n', '', 'G')

  if $chomp_certname == '' {
    fail("Unable to determine certname")
  }

  ini_setting { 'puppet main certname':
    path    => '/etc/puppetlabs/puppet/puppet.conf',
    section => 'main',
    setting => 'certname',
    value   => $chomp_certname,
    ensure  => present,
  }

}
