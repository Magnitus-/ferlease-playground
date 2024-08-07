# About

Playground repo to test the workflow of the **ferlease** client.

This repo is probably best forked in devs' userspace to test the gitops workflow.

It contains an incomplete (providers are missing in terraform, some parameters are missing in kubernetes for a complete fhir orchestration) orchestration of the fhir service which is meant to provide a guideline concerning how such a service might be orchestrated in kubernetes and its postgres database configured in terraform, using ferlease templating.

# Repo Structure

## Fluxcd Service Orchestration

- **qa/fluxcd**: Directory to hold fluxcd resources pointing to various apps. In it, there is a **fhir-releases** subdirectory for ferlease to manage the releases of the **fhir** service
- **qa/apps**: Apps directory for various apps that the **fluxcd** kustomization resources will point to.
- **ferlease-templates/fhir/kubernetes**: Repo holding templates for the **ferlease** client **fhir** templates to do service releases with fluxcd.

## Postgres Credentials in Vault

- **qa/vault-secrets**: Directory that holds the vault secrets. The **fhir-releases** subdirectory will contain ferlease generated postgres credentials for vault.
- **ferlease-templates/fhir/vault-secrets**: Repo holding templates for the **ferlease** client **fhir** templates to do vault secrets releases with terraform.

## Postgres Database 

- **qa/postgres-db**: Directory that holds the postgres database configuration. The **fhir-releases** subdirectory will contain ferlease generated postgres databases.
- **ferlease-templates/fhir/postgres-db**: Repo holding templates for the **ferlease** client **fhir** templates to do postgres database releases with terraform.