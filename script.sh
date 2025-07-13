#!/bin/bash

echo "Criando as imagens........"

docker build -t filipecsoares/projeto-backend:1.0 backend/.
docker build -t filipecsoares/projeto-database:1.0 database/.

echo "Realizando o push das imagens...."

docker push filipecsoares/projeto-backend:1.0
docker push filipecsoares/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes..."
kubectl apply -f ./services.yml

echo "Criando os deployments..."
kubectl apply -f ./deployment.yml
