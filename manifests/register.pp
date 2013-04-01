# =Define motd::register
# 
# Used by other modules to register themselves in the motd.
# This module is based on the example given in +concat+ source code.
#
# == Parameters
#
#   [*namevar*]
#     A unique name.  Is not used in the manifest.
#
# == Examples
#
#   class apache {
#      include apache::install, apache::config, apache::service
#   
#      motd::register{"Apache": }
#   }
# 
# == Requires
#
#   class { motd: }
#
define motd::register($content="", $order=10) {
   if $content == "" {
      $body = $name
   } else {
      $body = $content
   }

   concat::fragment{"motd_fragment_$name":
      target  => "/etc/motd",
      content => "    -- $body\n"
   }
}
