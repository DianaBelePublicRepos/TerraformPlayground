resource "google_container_node_pool" "extra-pool" {
  name               = "extra-node-pool"
  location           = "europe-west1-b"
  cluster            = google_container_cluster.gke-cluster.name
  initial_node_count = 3
}
