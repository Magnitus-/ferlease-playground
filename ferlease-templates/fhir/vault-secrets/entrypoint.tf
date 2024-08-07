resource "random_password" "{{.Service}}_feature_{{.Release}}" {
  length  = 30
  special = true
}

resource "vault_kv_secret_v2" "{{.Service}}_feature_{{.Release}}" {
  mount = vault_mount.{{.Environment}}.path
  name  = "cluster-{{.Environment}}/postgres/credentials/{{.Service}}-feature-{{.Release}}"
  data_json = jsonencode(
    {
      username = "{{.Service}}-feature-{{.Release}}"
      password = random_password.{{.Service}}_feature_{{.Release}}.result
    }
  )
}