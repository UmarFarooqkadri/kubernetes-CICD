module "cluster" {
  source             = "./kube_cluster"
  project_id         = "kubernetes-interview-questions"
  region             = "us-central1"
  is_custom_zone     = "us-central1-c"
  cluster_name       = "nodejs-cluster"
  min_node_count     = 1
  max_node_count     = 3


  auto_repair                        = true
  auto_upgrade                       = true
  preemptible_compute                = true
  prevent_destroy                    = true
  disable_horizontal_pod_autoscaling = false 
  disable_http_load_balancing        = false
  disable_network_policy_config      = true
  
}

data "google_client_config" "gke_cluster" {
}

