module "network" {
  source      = "zerotier/network/zerotier"
  version     = "1.0.0"
  name        = "yandex"
  description = "Yandex Networks Routes Managed by Terraform"
  assign_ipv6 = { zerotier = false, sixplane = false, rfc4193 = false }
  subnets     = var.subnets
  flow_rules  = "accept;"
  private     = var.private
  routes = [
    { target = "5.45.192.0/18", via = "192.168.196.1" },
    { target = "5.255.192.0/18", via = "192.168.196.1" },
    { target = "37.9.64.0/18", via = "192.168.196.1" },
    { target = "37.140.128.0/18", via = "192.168.196.1" },
    { target = "77.88.0.0/18", via = "192.168.196.1" },
    { target = "84.252.160.0/19", via = "192.168.196.1" },
    { target = "87.250.224.0/19", via = "192.168.196.1" },
    { target = "93.158.128.0/18", via = "192.168.196.1" },
    { target = "95.108.128.0/17", via = "192.168.196.1" },
    { target = "100.43.64.0/19", via = "192.168.196.1" },
    { target = "141.8.128.0/18", via = "192.168.196.1" },
    { target = "178.154.128.0/19", via = "192.168.196.1" },
    { target = "178.154.160.0/19", via = "192.168.196.1" },
    { target = "185.32.187.0/24", via = "192.168.196.1" },
    { target = "199.21.96.0/22", via = "192.168.196.1" },
    { target = "199.36.240.0/22", via = "192.168.196.1" },
    { target = "213.180.192.0/19", via = "192.168.196.1" }
  ]
}
