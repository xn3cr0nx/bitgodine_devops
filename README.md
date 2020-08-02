# github-devops

This repository contains Ansible setup and roles to manage infrastructure deployment and automated CI/CD for Bitgodine application.

## Hosts

Ansible is based on ec2 plugin with dynamic inventory to dynamically target the hosts based on AWS environment variable. Envorinment variables should be setup in GitHub repository and they are referred through GitHub Actions workflow.

## Workflow

The system workflow is designed to start the CI/CD when the repository is triggered through a trigger event from another repository targeting this one. In this case Ansible install requirements and runs the playbook.yml file containing all the operations to setup the infrastructure based on environment. In the end a Slack notification is dispatched to notify about a success or a failure in the pipeline.

### Playbook

The playbook is made un by the roles should be installed in EC2 based on its tags. Currently we are targeting staging environment, hence the EC2 with tag env:staging will be targeted.

First operations are common for each service, that means create the user that will run the service and all dependencies. Finally each service is launched running the docker image previously built in the repository workflow.
