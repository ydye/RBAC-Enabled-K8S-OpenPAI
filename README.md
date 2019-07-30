### RBAC-Enabled-K8S-OpenPAI
Deploy OpenPAI on the k8s with RBAC

### Deploy k8s-Dashboard for OpenPAI

```bash
cd dashboard/
cp dashboard.yaml dashboard.fin.yaml
sed -i "s/{nodename}/${YOUR_NODE_NAME}/g" dashboard.fin.yaml
kubectl create -f dashboard.fin.yaml
```

### Build paictl-env image for batch-job (Optional)

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

### Create ServiceAccount for paictl

```bash
cd paictl
kubectl create -f paictl-sa.yaml
kubectl create -f paictl.yaml
``` 

### Prepare your cluster configuration

##### Write you cluster configuration

[OpenPAI's configuration example](https://github.com/microsoft/pai/tree/pai-0.14.y/examples/cluster-configuration)

##### Create a configmap for the Patch Job to mount


