# Ambassador Deployment

Simple Ambassador Deployment to provide one central HTTPs-enabled endpoint for 

- CI/CD showcase deployments / apps
- CI services (Anchore, Sonarqube)

## TLS offloading

Ambassador could do TLS offloading itself, but would require valid TLS certificates as Kubernetes secrets then.
Since we don't have Certmanager and/or ExternalDNS in the test cluster yet, this would require too many manual steps.

Instead, we depend on ACM managed certificates, and TLS-offloading implemented by the external AWS Loadbalancer -- which still requires manual steps, but fewer.

## Prerequisites

installing Ambassador requires a few manual steps:

- Create A DNS CNAME record pointing to the AWS load balancer created by this
- Create an ACM certificate for this DNS CNAME
  - Let AWS create validation DNS records for you, wait for the certificate request to validate
- Enter the Certificate's ARN as a build secret in Github Actions

Search for `aws-load-balancer-ssl-cert` in [./deployment/04_ambassador-service.yaml](./deployment/04_ambassador-service.yaml) to see the usage of the ACM certificate.

## TODOs

Implement ACM certificate creation in an automated fashion (terraform, simple shell script) -- or install Certmanager and ExternalDNS.
