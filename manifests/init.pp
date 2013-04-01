# =Class motd
#
# This module is based on the example given in +concat+ source code.
#
# == Parameters
#
#   [*parameter*]
#     Description
#
# == Examples
#
#
# == Requires
#
# - concat
#
class motd {
   $motd = "/etc/motd"
   
   concat{$motd:
      owner => root,
      group => root,
      mode  => '0644',
   }

   concat::fragment{"motd_header":
      target => $motd,
      content => template( 'motd/motd.erb' ),
      order   => 01,
   }

   # local users on the machine can append to motd by just creating
   # /etc/motd.local
   concat::fragment{"motd_local":
      target => $motd,
      ensure  => "/etc/motd.local",
      order   => 15
   }
}
