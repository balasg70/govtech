

Build Docker Image Locally

#docker build -t nodejs-mysql-crud:latest .

Start Minikube and Load Image

#minikube start
#minikube image load nodejs-mysql-crud:latest

Apply Kubernetes Manifests

#kubectl apply -f mysql-pvc.yaml
#kubectl apply -f mysql-deployment.yaml
#kubectl apply -f deployment.yaml
#kubectl apply -f service.yaml
#kubectl apply -f ingress.yaml
