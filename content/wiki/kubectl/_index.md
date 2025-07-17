+++
draft = false
title = 'kubectl'
+++

Es una herramienta para administrar kubernetes (k8) por la terminal, y es [parte del proyecto](https://github.com/kubernetes/kubernetes/blob/master/cmd/kubectl/kubectl.go).

Para facilitar la escritura del comando en la terminal, le asigno un [alias](https://nicola.strappazzon.me/wiki/terminal/config/) para ser llamado por la letra `k` en vez de usar el nombre del comando completo, lo hago de la siguiente forma:

```bash
alias k="kubectl"
```

## Configuración

Muestra la configuración del comando, lo que esta en `~/.kube/config`.

```bash
kubectl config view
```

Lista los cluster que están configurados:

```bash
kubectl config get-contexts
```

Renombre un cluster:

```bash
kubectl config rename-context arn:aws:eks:eu-west-1:000000000000:cluster/com-prd-k8 prd
```

Define temporalmente un cluster a usar:

```bash
kubectl config use-context prd
```

Muestra la información del cluster seleccionado:

```bash
kubectl cluster-info
```

Definir un namespace por defecto:

```bash
kubectl config set-context --current --namespace=demo
```


{{% blockquote type="note" %}}
Si no define un namespace por defecto, deberá especificarlo cada vez que ejecuta el comando de la siguiente forma: `--namespace demo` o `-n demo`.
{{% /blockquote %}}

## Manifiestos

Si queremos aplicar un manifiesto en k8 que esta definido en el fichero `api.yaml` por ejemplo, tenemos los siguientes comandos:

Para crear los recursos:

```bash
kubectl create -f api.yaml
```

Para actualizar el recurso:

```bash
kubectl apply -f api.yaml
```

Para eliminar el recurso:

```bash
kubectl delete -f api.yaml
```

## Namespaces

Listar todos los namespaces del cluster:

```bash
kubectl get namespace
```

Crear un nuevo namespace llamado `demo`:

```bash
kubectl create namespace demo
```

Eliminar un namespace llamado `demo`:

```bash
kubectl delete namespace demo
```

{{% blockquote type="warning" %}}
NO USAR `--all`, borra todos los namespaces.
{{% /blockquote %}}

## Escalar y Desescalar

Solo debe cambiar el número definido en `--replicas=3` al deseado.

```bash
kubectl scale --replicas=3 deployment/api
```

## Reiniciar

```bash
kubectl rollout restart deployment/api
```

## Logs

```bash
kubectl logs pod demo-api-598f6c5bb6-mmg4d
```

## Describir

```bash
kubectl describe deployment demo-api
kubectl describe pod demo-api-598f6c5bb6-mmg4d
```

## Eliminar

```bash
kubectl delete replicaset demo-api-598f6c5bb6-mmg4d
```

## ConfigMap

```bash
kubectl describe configmap demo
```

## Volumenes

Lista los volumenes persistentes

```bash
kubectl get pvc
```
