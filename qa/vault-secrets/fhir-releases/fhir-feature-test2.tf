resource "random_password" "fhir_feature_test2" {
  length  = 30
  special = true
}

resource "vault_kv_secret_v2" "fhir_feature_test2" {
  mount = vault_mount.qa.path
  name  = "cluster-qa/postgres/credentials/fhir-feature-test2"
  data_json = jsonencode(
    {
      username = "fhir-feature-test2"
      password = random_password.fhir_feature_test2.result
    }
  )
}