### Commands

```bash
$ kubectl exec -it {{ }} --container {{ }} -- /bin/bash

$ kubectl port-forward {{ }} 3000:3000

$ kubectl config get-contexts
$ kubectl config current-context
$ kubectl config use-context {{ }}

$ kubectl logs -f --tail=10 {{ }}
```

### Resources

Github:
- [pixie](https://github.com/pixie-labs/pixie) - Instant Kubernetes-Native Application Observability
