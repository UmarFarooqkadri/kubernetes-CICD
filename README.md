ZenHub DevOps Assignment
------------------------

## Overview

For this assignment, you will be tasked with configuring an automated deployment for a fictional REST API application built using [Node.js](https://nodejs.org/).

## Included Resources

In [this repository](https://github.com/ZenHubHQ/devops-interview) you'll find a tiny `node.js` REST API which simply prints "Hello World!".

## Requirements

We want to see this application fully deployed to the cloud. Here is a breakdown of a few things that we would like to see:

1. Containerize the API app using [Docker](https://www.docker.com/)
  - You may use any `node.js` container version for this app
  - Bonus points for optimizing for build efficiency and addressing security concerns
2. Deploy the API to the cloud with Kubernetes
  - You can use any cloud provider you want (ie. GCP, AWS, Azure, DigitalOcean, etc...)
  - You can use any Kubernetes flavour you want (GKE, EKS, Minikube, Linode, DigitalOcean, etc...)
  - We would like to see you adopt the ["infrastructure as code" principles](https://en.wikipedia.org/wiki/Infrastructure_as_code) as much as possible
  - Your Cloud configuration should be done primarily with Terraform but you can use additional scripts or tools as long as they are easily repeatable with minor configuration changes
  - Document anything you couldn't write "as code"
3. Automate the deployment of the API
  - The app should be auto-deployed when a commit is made to the repository. If you're not able to do this, at a minimum there should be a way to trigger the deployment process manually (provide documentation)
  - You can use any type of CI you want (GitHub Actions, Gitlab CI, Jenkins, etc...) but configuration should be "as code"
  - Consider how you would setup continuous deployment of application configuration changes (eg. adding a new ENV variable, or adjusting the replica count for the application, etc...)
4. Add a `SUBMISSION.md` file which lists your decisions and instructions on how to reproduce your steps

## Notes

A few notes to help you:

- We don't expect to review the actual cloud resources, you can destroy them once your assignment is done to avoid incurring costs
- Keep your cost low! Use the cheapest options and document what would be ideal for production (most providers have free tiers)
- Registering a new account, subscribing and handling authorization between third party providers can be complex to automate but should be documented if done not as code
- Documentation is an important part of your solution. Document your thought process and what you are planning, or the types of things you’d take into account if this were a production application.
- We are going to make the assumption that you are aware of some of the other facets of operations, and we are not asking or expecting you to implement any monitoring, alerting, or that kind of thing in the exercise.
- We are passionate about security. Take note of the parts of your code that need to be handled with care and document them appropriately.

If you run into any issues throughout the process or have questions, please reach out to devops@zenhub.com
