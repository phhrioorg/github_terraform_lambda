module "ecr-repo" {
  source = "./../modules/ecr"
  tags = var.tags
  image_mutability = var.image_mutability
}
