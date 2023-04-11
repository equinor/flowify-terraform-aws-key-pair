variable "create_keys" {
  type        = bool
  default     = true
  description = "Wheter add ssh keys to the new AWS region or not. Only first env in region should use true"
}

variable "region" {
  type        = string
  default     = "us-west-1"
  description = "The region where AWS operations will take place"
}

variable "public_key_material" {
  type        = map(any)
  description = "List of the public key material"

  default = {
    ops-dev = [
      "ops-dev",
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDpT7Tzwq5ZJcc6PnQ0F60fZxr/1SivxCIU0x58ywMeTVq1I1sOVZghefxyNh/2/5FbjDd6bVG/w+WFT/J2ebknTLtBAgcN2JdAHV8DPj9KTKkmaDNGk2hdEI+Vd96Xm+EYpvyJPgfW0GY/rKP475NaU9a+B97DsOVf+EDv8Fb9V/n2u6Vl67MozUdOvXnfgP2gRHUEk58tK7XPdCBCXMZb5hhnpchVliO/DHUnT+ZetyAfGjTbP+okht3PP5UQnxIxomMTbNfLXdtme0EKzh7N6e95WRAqCPaVvIQc6vGoRCV3uamprVef0iNJdaglzgEtTwFlxydLq/QhoL4ItaA5k6Ep6YX+I8lSiQ8QbBgZKIZgz2xSEU8EyV1R/ufrAJaOjAmMio+cFF9wDV4kkdxI3qJ7rfeGvPAP7ri5EgdVVu7hTEDMD41KisHGiKaZOE9JJ70MCzD5cet02k15sTJwbZ1m5bnfKN1IUwTzoS3gFjBK5thnSZ6Jl7XFAJe/Puk= ops-dev",
    ]
  }
}

variable "public_key_name" {
  type        = list(string)
  default     = ["ops-dev"]
  description = "List of names the public key material"
}
