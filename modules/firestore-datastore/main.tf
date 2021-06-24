resource "google_project_service" "firestore_api" {
  service            = "firestore.googleapis.com"
  disable_on_destroy = false
}
  resource google_app_engine_application "app" {
  provider      = google-beta
  location_id   = var.region
  database_type = "CLOUD_FIRESTORE"
  }



resource "google_firestore_document" "mydoc" {
  project     = "my-project-name"
  collection  = "somenewcollection"
  document_id = "my-doc-%rr"
  fields      = "{\"something\":{\"mapValue\":{\"fields\":{\"akey\":{\"stringValue\":\"avalue\"}}}}}"
}

resource "google_firestore_document" "sub_document" {
  project     = "my-project-name"
  collection  = "${google_firestore_document.mydoc.path}/subdocs"
  document_id = "bitcoinkey"
  fields      = "{\"something\":{\"mapValue\":{\"fields\":{\"ayo\":{\"stringValue\":\"val2\"}}}}}"
}

resource "google_firestore_document" "sub_sub_document" {
  project     = "my-project-name"
  collection  = "${google_firestore_document.sub_document.path}/subsubdocs"
  document_id = "asecret"
  fields      = "{\"something\":{\"mapValue\":{\"fields\":{\"secret\":{\"stringValue\":\"hithere\"}}}}}"
}
resource "google_firestore_index" "my-index" {
  project = "my-project-name"

  collection = "chatrooms"

  fields {
    field_path = "name"
    order      = "ASCENDING"
  }

  fields {
    field_path = "description"
    order      = "DESCENDING"
  }

  fields {
    field_path = "__name__"
    order      = "DESCENDING"
  }
}
