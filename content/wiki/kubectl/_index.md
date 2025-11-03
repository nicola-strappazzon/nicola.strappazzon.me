+++
draft = false
title = 'kubectl'
+++

Es una herramienta para administrar kubernetes (k8) por la terminal, y es [parte del proyecto](https://github.com/kubernetes/kubernetes/blob/master/cmd/kubectl/kubectl.go).

Para facilitar la escritura del comando en la terminal, le asigno un alias en [.bash_profile](https://nicola.strappazzon.me/wiki/terminal/config/) para ser llamado por la letra `k` en vez de usar el nombre del comando completo, lo hago de la siguiente forma:

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

Para conocer los HPA disponibles:

```bash
kubectl get hpa
```

Definir el minimo y maximo del HPA:

```bash
kubectl patch hpa api -p '{"spec":{"minReplicas": 10}}'
```

## Reiniciar

```bash
kubectl rollout restart deployment/api
```

## Logs

```bash
kubectl logs pod demo-api-598f6c5bb6-mmg4d
```

## Connect

```bash
kubectl exec --stdin --tty demo-api-598f6c5bb6-mmg4d -- /bin/sh
```

Hay distribuciones que no tienen `/bin/bash` y hay que usar `/bin/sh`.

## Desplegar

Cómo ejecutar un pod de una imagen cualquiera en el cluster, muy útil para depurar.

```bash
kubectl run tmp-alpine-shell --restart=Never --rm --stdin --tty --image=alpine -- /bin/sh
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

## Containers

Un pod puede estar ejecutando uno o varios contenedores, lo puedes describir escribiendo:

```bash
kubectl get pods -o=jsonpath="{.items[*].spec.containers[*].name}"
```

Para poder ver los logs de un determinado contenedor usando `-c container_name`, escribir:

```bash
kubectl logs pod/demo-api-598f6c5bb6-mmg4d -c grafana -n monitor
```

## Secret

Para conocer o listar los secrets:

```bash
kubectl get secrets
```

Ver el detalle del secret:

```bash
kubectl describe secret api
```

Para ver el contenido del secret:

```bash
kubectl get secret api -o jsonpath='{.data}' | jq
```

Decodificar un valor del secret:

```bash
echo "d3NzOi8vZGVtZXJ6ZWwuc3RnLnRobi5hcHA6ODA=" | base64 --decode
```

Obtener de forma directa el valor y decodificarlo:

```bash
kubectl get secret api -o jsonpath='{.data.password}' | base64 --decode
```

## Job/Cronjob

Ejecutar un job de forma manual, excelente para probar:

```bash
kubectl create job --from=cronjob.batch/demo "cronjob-manually-$(date '+%s')" --namespace demo
```
