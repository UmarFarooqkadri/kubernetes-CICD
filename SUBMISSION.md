# Sample NodeJS Application

---


The following steps will help you create a `Kubernetes` Cluster on `GKE` using `Terraform` and deploy the `NodeJS` `Dockerized` application on the cluster using `Helm` using `Github Actions`.

This projected is divided into 3 Parts + 1 Bonus part on security
1. Setup the Infrastructure
    
    This is used to setup the Kubernetes Cluster using Terraform. This step is completely automated.
2. Manual Intervention

    A few things need to be created manually before the sample NodeJs project is deployed on the Cluster using automated CI/CD pipeline. 

3. Setup the CICD

    This lets you deploy the NodeJS application on the Kuberenetes Cluster on every push to the repositoy. This is also a completely automated step.

4. Bonus - Security Workflow    




Now, let's get started.

---

## Setup the Infrastructure

### IaaC using Terraform 

We will create a Kubernetes Cluster using Terraform. We need to make sure that we have authenticated our CLI to perform operations on GCP so that terraform can create resources.

**Commands:**


Execute the following commands from within the `terraform` directory after autheticating from 



> Initialize a working directory containing Terraform configuration files

```
    terraform init
```

> Create an execution plan with a preview of the changes that Terraform will make to our infrastructure.

```
    terraform plan
```

> Use the optional -out=FILE option to save the generated plan to a file named `apply_plan.tf` on disk.

```
    terraform plan -out apply_plan.tf
```

> Pass the filename of a saved plan file i.e. `apply_plan.tf` you created in the above step.

```
    terraform apply .\apply_plan.tf
```    

Notes

* **State File**: We can also store Terraform state file on a pre-existing bucket on Google Cloud Storage (GCS) [https://www.terraform.io/docs/language/settings/backends/gcs.html]

* **Module- kube_cluster**: `main.tf` uses the module `kube_cluster` present in `terraform` directory.

---

## Manual Intervention

Before we proceed with the fully automated CI/CD setup, create a few resources that are needed in the next steps. These steps can also be automated; however, I have left it for now. Hence, these actions need to carried out manually.

1. Create a service account in GCP and assign the below roles.
    
    i.  Kubernetes Engine Cluster Admin

    ii. Kubernetes Engine Developer

    iii. Storage Admin

2. Create a key  with the service account and add it to the github repo under secrets and name the secret as `GKE_SA_KEY`. This variable will be used in `.github/workflows/github-ci.yaml` file

3. Create a token in github and name it as GIT_TOKEN

4. Container Registry in GKE should have a repo with the name of `node-js`

5. Add image repo in GCP and add in `github-ci.yaml`


---

## Setup the CICD

### Deployment using Github Actions

Whenever a commit/push takes place on the repository, a docker image is created using `docker build`.

### Orchestration using Kubernetes

Whenever a commit/push takes place on the repository, the docker image is deployed using `Helm`


---

## Bonus - Security Workflow

We can use code scanning to find security vulnerabilities on GitHub using trivy.
However, Code scanning is available for all public repositories, and for private repositories owned by organizations where GitHub Advanced Security is enabled.

After we enable the Github Advanced Security, the `security-analysis.yaml` file can be used to add a step in the github actions. This would scan and upload the results to the Security tab.

Please refer below link:

https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/about-code-scanning

https://docs.github.com/en/code-security/code-scanning/automatically-scanning-your-code-for-vulnerabilities-and-errors/setting-up-code-scanning-for-a-repository

I have also added a image of the scan on a public repo (image Scannig_on_public_repo.PNG)

---

## Limitations

1. The app is deployed in the cluster using a node port service and can be accessed from the CLI using the below command. 
 

```
    kubectl port-forward deployment.apps/node-js 8080:3000 -n node-js
```


---

## Notes

* In a production environment an Ingress controller like NginX etc would be provisioned and a Load Balancer would also be created with DNS entry for the domain name. Additionally we would use cert manager to enable https and automated creation/rotation of certificates.

* Since this is a demo app, I did not integrate it with DNS, Ingress Controller and Cert Manager.