module "ecr-repo" {
  source = "./module/ecr.tf"
  tags = var.tags
  image_mutability = var.image_mutability
}
