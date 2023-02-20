# About

Playground repo to test the workflow of the upcoming **ferlease** client.

This repo is probably best forked in devs' userspace to test the gitops workflow.

# Repo Structure

- **fluxcd**: Repo to hold fluxcd resources pointing to various apps. In it, there is a **hello-world-release** subdirectory for ferlease to manage the releases of the **hello-world** service
- **apps**: Apps repo for various apps that the **fluxcd** kustomization resources will point to.
- **ferlease-templates**: Repo holding templates for the **ferlease** client to do releases. It holds the **hello-world** template.