### Network vars

variable "private" {
  description = "Private or Public network"
  default     = true
}

variable "routes" {
  description = "Routes to be pushed down to client."
  type = list(object({
    target = string
    via    = string
  }))
  validation {
    condition     = can([for r in var.routes : regex("([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])/([0-9]|[12][0-9]|3[012])", r.target)])
    error_message = "Route targets should be a valid IPv4 CIDR."
  }
  validation {
    condition     = can([for r in var.routes : regex("([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])", r.via)])
    error_message = "Route via should be a valid IPv4 address."
  }
  default = []
}

variable "subnets" {
  description = "Subnet CIDR Ranges."
  type        = list(string)
  default     = []
}

### Members vars

variable "central_router_ip" {
  type = string
}

variable "central_router_id" {
  type = string
}

variable "members_list" {
  description = "Map of members."
  type        = map(any)
  default = {
    member_id = {
      name        = "member_name",
      description = ""
    }
  }
}