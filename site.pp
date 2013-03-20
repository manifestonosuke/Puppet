import "./apps.pp"
import "./users.pp"
import "./files.pp"
node default {
tag(work)
include apps_browser
include apps_common
include apps_system
}
