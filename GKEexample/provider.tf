provider "google" {
  credentials = file("./creds/serviceaccount.json")
  project     = "dianatest1"
  region      = "europe-west1"
}
