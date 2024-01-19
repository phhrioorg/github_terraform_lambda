module "ecr-repo" {
  source = "module/ecr"
  tags = var.tags
  image_mutability = var.image_mutability
}
