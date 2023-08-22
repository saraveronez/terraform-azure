module "production" {
  source = "../infra"
  environment = "prod"
  location = "brazilsouth"
}