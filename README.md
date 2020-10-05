# helm-dnspod-webhook-cert-manager-example

Alidns-webhook-cert-manager is a cert-manager plugin to manage SSL certificates on Kubernetes. 

Along with Nginx Ingress, you can configure HTTPS access to the website. With Let's Encrypt provide free SSL certificates, all the free packs of cert-manager + Nginx Ingress + Let's Encrypt are automatic generated. But cert-manager does not support Alidns(Alibaba Cloud's DNS) by default. 

You can modify it and use Alidns-webhook-cert-manager. There is example about installing it with Helm in the article.

## Prerequisites

- [Kubernetes(K8S)](https://kubernetes.io/)
  Kubernetes (K8s) is an open-source system for automating deployment, scaling, and management of containerized applications.

- [Helm](https://helm.sh/)
  Helm is the best way to find, share, and use software built for Kubernetes.

- [cert-manager](https://cert-manager.io/)
  x509 certificate management for Kubernetes


## How to Install

```shell
# git clone example and alidns-webhook-cert-manager.
$ git clone --recursive https://github.com/CloudoLife/helm-alidns-webhook-cert-manager-example

$ cd helm-alidns-webhook-cert-manager-example
```

### Custom Values.yaml

Edit [values.yaml](./values.yaml) in helm-alidns-webhook-cert-manager-example directory, and replace content within < and >.
```shell
# cat values.yaml

# cert-manager-webhook-alidns/values.yaml at master · CloudoLife/cert-manager-webhook-alidns
# https://github.com/CloudoLife/cert-manager-webhook-alidns/blob/master/deploy/webhook-alidns/values.yaml

# The GroupName here is used to identify your company or business unit that
# created this webhook.
# For example, this may be "acme.mycompany.com".
# This name will need to be referenced in each Issuer's `webhook` stanza to
# inform cert-manager of where to send ChallengePayload resources in order to
# solve the DNS01 challenge.
# This group name should be **unique**, hence using your own company's domain
# here is recommended.
groupName: <Your Company>

# Alibaba Cloud Document Center: Find the Documentation for Your Needs - Alibaba Cloud
# https://www.alibabacloud.com/help/doc-detail/50086.htm
regionId: <Your Alidns Region Id>
secrets:
  accessKeyId: <Your Alidns Access Key Id>
  accessKeySecret: <Your Alidns Access Key Secret>

clusterIssuer:
  enabled: true
  # staging: false
  email: <Your email>

  # https://cert-manager.io/docs/configuration/acme/#adding-multiple-solver-types
  selector:
    dnsZones:
      - <Your domain>

image:
#   repository: cloudolife/cert-manager-webhook-alidns
# Or
  repository: <Your Repository>/cert-manager-webhook-alidns
  tag: latest
  pullPolicy: IfNotPresent

# nameOverride: ""
# fullnameOverride: ""

# service:
#   type: ClusterIP
#   port: 443

# resources: {}
#   # We usually recommend not to specify default resources and to leave this as a conscious
#   # choice for the user. This also increases chances charts run on environments with little
#   # resources, such as Minikube. If you do want to specify resources, uncomment the following
#   # lines, adjust them as necessary, and remove the curly braces after 'resources:'.
#   # limits:
#   #  cpu: 100m
#   #  memory: 128Mi
#   # requests:
#   #  cpu: 100m
#   #  memory: 128Mi

# nodeSelector: {}

# tolerations: []

# affinity: {}
```

### Install by Helm

Helm install cert-manager-webhook-alidns within cert-manager namespace. Please create cert-manager namespace first if not exist.

```shell
$ helm install --name cert-manager-webhook-alidns --namespace=cert-manager ./cert-manager-webhook-alidns/deploy/webhook-alidns -f values.yaml
```

See Helm release about cert-manager-webhook-alidns.

```shell
$ helm list -n cert-manager
NAME                       	NAMESPACE   	REVISION	UPDATED                               	STATUS  	CHART                            	APP VERSION
cert-manager-webhook-alidns	cert-manager	1       	2020-09-25 12:57:30.168666 +0800 +0800	deployed	webhook-alidns-0.1.0             	1.0
```

See pods about cert-manager-webhook-alidns.

```shell
$ kubectl get pods -n cert-manager
...
```

## References
[1] [CloudoLife/helm-alidns-webhook-cert-manager-example: Examples about Helm install Alidns Webhook cert-manager. https://github.com/CloudoLife/helm-alidns-webhook-cert-manager-example - https://github.com/CloudoLife/helm-alidns-webhook-cert-manager-example](https://github.com/CloudoLife/helm-alidns-webhook-cert-manager-example)

[2] [CloudoLife/cert-manager-webhook-alidns: Alidns webhook for cert-manager - https://github.com/CloudoLife/cert-manager-webhook-alidns](https://github.com/CloudoLife/cert-manager-webhook-alidns)

[3] [cert-manager - https://cert-manager.io/](https://cert-manager.io/)

[4] [jetstack/cert-manager-webhook-example: A cert-manager sample repository for creating an ACME DNS01 solver webhook - https://github.com/jetstack/cert-manager-webhook-example](https://github.com/jetstack/cert-manager-webhook-example)

[5] [Helm - https://helm.sh/](https://helm.sh/)

[6] [Kubernetes - https://kubernetes.io/](https://kubernetes.io/)
