module github.com/jetstack/cert-manager-webhook-example

go 1.12

require (
	github.com/aliyun/alibaba-cloud-sdk-go v1.61.98
	github.com/dgrijalva/jwt-go v3.2.0+incompatible // indirect
	github.com/google/martian v2.1.0+incompatible
	github.com/imdario/mergo v0.3.11 // indirect
	github.com/jetstack/cert-manager v1.1.0
	golang.org/x/oauth2 v0.0.0-20190402181905-9f3314589c9a // indirect
	k8s.io/apiextensions-apiserver v0.18.16
	k8s.io/apimachinery v0.18.16
	k8s.io/client-go v0.18.16
)

replace github.com/evanphx/json-patch => github.com/evanphx/json-patch v0.0.0-20190203023257-5858425f7550
