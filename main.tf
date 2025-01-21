module "flask_app" {
  source           = "./apps/flaskapp"
  project_name     = "testing-ground"
  container_image  = "lroquec/cicd-tests:latest"
  ecs_cluster_name = "myECSCluster"
  ecs_service_name = "myflaskapp"
  container_port   = 5000
}

module "nginx_app" {
  source           = "./apps/nginxapp"
  project_name     = "nginx"
  container_image  = "lroquec/system-info:latest"
  ecs_cluster_name = "myECSCluster"
  ecs_service_name = "mynginxapp"
  container_port   = 80
}