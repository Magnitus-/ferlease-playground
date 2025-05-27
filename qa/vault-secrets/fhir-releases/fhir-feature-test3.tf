resource "random_password" "fhir_feature_test3" {
  length  = 30
  special = true
}

resource "vault_kv_secret_v2" "fhir_feature_test3" {
  mount = vault_mount.qa.path
  name  = "cluster-qa/postgres/credentials/fhir-feature-test3"
  data_json = jsonencode(
    {
      username = "fhir-feature-test3"
      password = random_password.fhir_feature_test3.result
    }
  )
}