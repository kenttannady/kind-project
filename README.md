# Kind-Project: Setup Kubernetes with Kind, Helm, Kubectl, Prometheus, and More

This project aims to automate the setup of a Kubernetes cluster using KinD, along with the deployment of Prometheus and backend services. It includes benchmarking and health checks to ensure everything is configured correctly.

## Getting Started

Before proceeding, ensure you have a Linux server or virtual machine ready. This guide assumes you are using a Linux distribution that supports `apt` for package management.

### Prerequisites

- **Virtual Machine**: Prepare a virtual machine (VM) with sufficient resources.
- **User and SSH Key**: Ensure you have a user with sudo privileges and SSH key access.
- **Domain Configuration**: Update your `/etc/hosts` file with the following domains:
 - `prometheus.moneyhero.com`
 - `apps1.moneyhero.com`
- **Configure inventory on Ansible by filling in the IP of the virtual machine**
- **Please make sure the version of Prometheus cli is the same as the version that gets installed on the Kubernetes**

### Initial Setup

1. **Run the Initial Setup Script**: Execute `initial-setup.sh` to install Python, Pip, and Ansible on your server and it will trigger ansible playbook for setup kubernetes with kind, helm, kubectl, prometheus, backend service, Run benchmarking and check that the configuration is healthy.


Please run initial-setup.sh.
bash ./initial-setup.sh

the instructions in initial-setup.sh


Check Python and Pip: This script checks if Python and Pip are installed. If not, it will install them.
Install Ansible: After ensuring Python and pip are installed, the script then installs Ansible using pip.
Configure Requirements: The script sets up a requirements.txt file for easy dependency management. You can add other required packages to this file.
Install Dependencies: Finally, the script installs all the dependencies listed in requirements.txt.
The last step is to run the Ansible Playbook to setup the Kubernetes with Kind, Helm, Kubectl, Prometheus, backend service, Run benchmarking and check that the configuration is healthy.



For setting up multi-node clusters on Kubernetes, use KinD.



We need to have one file with the name config-multi-node.yaml.
With the configuration, we have one node control panel and two nodes of workers.



config-multi-node.yaml
//
# three nodes (two workers) cluster config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
role: control plane
role: worker
role: worker
//


We will create a cluster with the name of the hero.


kind create cluster --name hero --config config-multi-node.yaml



The above command will create a Kubernetes cluster with the name hero, using the configuration specified in the config-multi-node.yaml file. This configuration file defines a cluster with one control plane node and two worker nodes, just the way you want it to be.



for ingress will follow the standard value. yaml
https://github.com/kubernetes/ingress-nginx/blob/main/charts/ingress-nginx/values.yaml


### Configuring Prometheus

Prometheus is configured to use the standard `values.yaml` with customization for Ingress. Ensure the Prometheus CLI version matches the installed Kubernetes version.

we only have to customize for using Ingress

  ingress:
    ## If true, Prometheus server Ingress will be created
    ##
    enabled: true
    hosts: prometheus.moneyhero.com

https://github.com/prometheus-community/helm-charts/blob/main/charts/prometheus/values.yaml



## Notes

- Ensure you have the necessary privileges to execute commands; this may require `sudo` or root access.
- This guide assumes compatibility with a Linux distribution that supports `apt` for package management. Adjustments may be needed for other distributions.
- After completing these steps, you will have Python, Pip, and Ansible installed, along with a configured Kubernetes cluster.


