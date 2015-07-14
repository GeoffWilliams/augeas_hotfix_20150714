# == Class: augeas_hotfix_20150714
#
# Install a fixed augeas lens for /etc/sudoers when included.  This addresses
# https://github.com/hercules-team/augeas/issues/262
#
# === Examples
#
#  include augeas_hotfix_20150714
#
# === Authors
#
# Author Name <geoff.williams@puppetlabs.com>
#
# === Copyright
#
# Copyright 2015 Puppet Labs, unless otherwise noted.
#
class augeas_hotfix_20150714 {
  file { "/opt/puppet/share/augeas/lenses/dist/tests/test_sudoers.aug":
    ensure => file,
    owner  => "root",
    group  => "root",
    mode   => "0644",
    source => "puppet:///modules/${module_name}/test_sudoers.aug"
  }

  file { "/opt/puppet/share/augeas/lenses/dist/sudoers.aug":
    ensure => file,
    owner  => "root",
    group  => "root",
    mode   => "0644",
    source => "puppet:///modules/${module_name}/sudoers.aug"
  }

}
