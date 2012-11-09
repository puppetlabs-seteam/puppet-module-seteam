class seteam {

  case $::osfamily {
    default: { }
    'RedHat': { include seteam::redhat }
    'Debian': { include seteam::debian }
  }

}
