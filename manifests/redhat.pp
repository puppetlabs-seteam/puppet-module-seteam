class seteam::redhat {
  include ntp
  include epel

  yumrepo { 'puppetlabs-products':
    baseurl  => 'http://yum.puppetlabs.com/el/$releasever/products/$basearch',
    descr    => 'Puppet Labs Products $releasever - $basearch',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
  }

  yumrepo { 'puppetlabs-enterprise':
    baseurl  => 'http://yum-enterprise.puppetlabs.com/el/$releasever/extras/$basearch',
    descr    => 'Puppet Labs Enterprise Extras $releasever - $basearch',
    enabled  => '1',
    gpgcheck => '1',
    gpgkey   => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
  }

}
