# Kubernetes Study Project

This repository contains a simple application stack designed for learning and practicing Kubernetes concepts. The project demonstrates how to containerize applications, build Docker images, push them to a registry, and deploy them using Kubernetes manifests.

## Project Structure

- **backend/**: PHP application (with Apache) that connects to a MySQL database.
- **database/**: MySQL database with initialization script.
- **frontend/**: Static HTML/CSS/JS frontend (not containerized in this setup).
- **deployment.yml**: Kubernetes deployments and persistent volume claim.
- **services.yml**: Kubernetes service definitions.
- **script.sh**: Helper script to build, push images, and deploy to Kubernetes.

## Prerequisites

- Docker
- Kubernetes cluster (e.g., Minikube, Docker Desktop, or cloud provider)
- kubectl configured to access your cluster
- Docker Hub account (or modify image names for your own registry)

## Usage

1. **Build and Push Docker Images**

   Run the provided script to build and push the backend and database images:

   ```bash
   ./script.sh
   ```

   This will:
   - Build Docker images for the backend and database.
   - Push the images to Docker Hub.
   - Apply the Kubernetes service and deployment manifests.

2. **Access the Application**

   - The PHP backend will be exposed via a LoadBalancer service.
   - Use `kubectl get services` to find the external IP or port.
   - The backend connects to the MySQL database using internal Kubernetes networking.

3. **Clean Up**

   To remove the resources:

   ```bash
   kubectl delete -f deployment.yml
   kubectl delete -f services.yml
   ```

## Notes

- **Passwords and Secrets**: For simplicity, the MySQL root password is set in the Dockerfile. In production, use Kubernetes Secrets.
- **Resource Requests/Limits**: Minimal resource requests and limits are set for demonstration.
- **Scaling**: The PHP deployment is set to 6 replicas by default.
- **Persistence**: MySQL uses a PersistentVolumeClaim for data storage.

## Learning Objectives

- Understand how to containerize applications with Docker.
- Learn how to build and push images to a registry.
- Deploy multi-container applications with Kubernetes.
- Use Persistent Volumes and Claims for stateful workloads.
- Expose services within and outside the cluster.
