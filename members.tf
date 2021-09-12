resource "zerotier_member" "central_router" {
  # source         = "zerotier/member/zerotier"
  # version        = "1.0.0"
  name                    = "central_router"
  description             = "central router"
  no_auto_assign_ips      = true
  hidden                  = false
  allow_ethernet_bridging = true
  authorized              = true

  member_id      = var.central_router_id
  network_id     = module.network.id
  ip_assignments = [var.central_router_ip]
}

# module "asus_nb" {
#   source      = "zerotier/member/zerotier"
#   version     = "1.0.0"
#   name        = "fra.strukkk.tk"
#   description = "central server"
#   member_id   = "a01e92a7cd"
#   network_id  = module.network.id
# }

resource "zerotier_member" "zerotier_member" {
  for_each                = var.members_list
  no_auto_assign_ips      = false
  hidden                  = false
  allow_ethernet_bridging = true
  authorized              = true

  # source      = "zerotier/member/zerotier"
  # version     = "1.0.0"
  network_id  = module.network.id
  name        = each.value.name
  description = each.value.description
  member_id   = each.key
}
