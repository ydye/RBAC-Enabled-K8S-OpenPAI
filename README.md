# RBAC-Enabled-K8S-OpenPAI
Deploy OpenPAI on the k8s with RBAC

## Build paictl-env image for batch-job (Optional)

##### Build

```bash
cd paictl
sudo docker build -t openpai-batch .
```
##### Tag the image 

```bash
sudo docker tag openpai-batch ${your_registry_url}/openpai-batch
```

##### Push your image into your docker registry

```bash
sudo docker push ${your_registry_url}/openpai-batch
```

## Create ServiceAccount for paictl

```bash
cd paictl
kubectl create -f paictl.yaml
``` 