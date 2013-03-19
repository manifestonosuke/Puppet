import "./apps.pp"
node default {
tag(work)
include apps_browser
include apps_common
include apps_system
}
