import "./apps.pp"
import "./users.pp"
import "./files.pp"
import "./fs.pp"


filebucket { main:
    #server => puppet,
    path   => "/root/$hostname",
  }


node default {
if  $domain == "localdomain" { tag(home) }
else { tag(work) }

if tagged(work) { notice("this is work") }
if tagged(home) { notice("this is home") }

include apps_browser
include apps_common
include apps_system
include custom_mounts
include share_home_mounts
include virt_user_common
include virt_user_admin
}
