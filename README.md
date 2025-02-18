# net narthollis kube lemon

## Project structure

### `/bootstrap/argocd`

This contains a [kustomize](https://kustomize.io/) project for deploying and managing
[ArgoCD](https://argo-cd.readthedocs.io/) in the primary kubernetes cluster. This project contains
an ArgoCD application such that ArgoCD will self-manage its own install going forwards. This allows
for easy upgrades and customisation of the ArgoCd install, by making changes to this repository.

### `/bootstrap/infra`

This kustomize projects creates an ArgoCD Project called infra. This project contains a self-managing
application such that this can all be managed easily from git.

The key part of this application is an ApplicationSet, that enumerates a matrix of the clusters managed
by the ArgoCD instance, and the the files found in `/infra/{app-name}/configs/{cluster-name}.yaml`

This setup allows for the selective install of each application in each cluster, and allowing each
cluster to customise the parameters of the application.

Since these applications are intended to be infrastructure components, no allowance is given for multiple
installations.

### `/bootstrap/apps`

> once setup, explain here how the apps part of the repo works

### `/infra/{app-name}`

These directories contain the necessary manifests and other resources for installing a given infrastructure
applications, such as network infrastructure.

### `/apps/{app-name}`

These directories contain the necessary manifests and other resources for installing an applications.
