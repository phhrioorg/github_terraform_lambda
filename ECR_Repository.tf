module "ecs" {
  source = "./ecs"
  aws_region = var.aws_region
  repository_url = module.ecr.repository_url
  depends_on = [module.ecr]
}
