data "vault_generic_secret" "creds" {
  path = "secret/cluster-qa/postgres/credentials/fhir-feature-test"
}

resource "postgresql_role" "role" {
  name                      = data.vault_generic_secret.creds.data.username
  password                  = data.vault_generic_secret.creds.data.password
  login                     = true
  encrypted_password        = true
  superuser                 = false
  create_database           = false
  create_role               = false
  replication               = false
  bypass_row_level_security = false 
}

resource "postgresql_database" "db" {
  name              = "fhir_feature_test"
  owner             = postgresql_role.role.name
  connection_limit  = 100
  allow_connections = true
  tablespace_name   = "pg_default"
  is_template       = false
  template          = "template0"
  encoding          = "UTF8"
  lc_collate        = "en_US.utf8"
  lc_ctype          = "en_US.utf8"
}