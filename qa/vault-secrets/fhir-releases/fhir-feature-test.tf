resource "random_password" "fhir_feature_test" {
  length  = 30
  special = true
}

resource "vault_kv_secret_v2" "fhir_feature_test" {
  mount = vault_mount.qa.path
  name  = "cluster-qa/postgres/credentials/fhir-feature-test"
  data_json = jsonencode(
    {
      username = "fhir-feature-test"
      password = random_password.fhir_feature_test.result
    }
  )
}