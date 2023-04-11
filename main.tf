#####################################
# Key-Pair Terraform Module         #
# Valid for both Tf 0.12.29 and 1.0 #
#####################################

provider "aws" {
  region = var.region
}

resource "aws_key_pair" "key" {
  count = var.create_keys == true ? length(var.public_key_name) : 0

  key_name   = element(var.public_key_material[var.public_key_name[count.index]], 0)
  public_key = element(var.public_key_material[var.public_key_name[count.index]], 1)
}
