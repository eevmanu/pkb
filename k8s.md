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

- Learning:
    - [kubernetes-basicLearning](https://github.com/knrt10/kubernetes-basicLearning/) - Understand kubernetes step by step. A simple repo for beginners
    - 2020-01-07 - [A Practical Step-by-Step Guide to Understanding Kubernetes](https://medium.com/better-programming/a-practical-step-by-step-guide-to-understanding-kubernetes-d8be7f82e533)

- Github:
    - [pixie](https://github.com/pixie-labs/pixie) - Instant Kubernetes-Native Application Observability

- YouTube:
    - Playlists:
        - [KodeKloud - Kubernetes for the Absolute Beginners](https://www.youtube.com/playlist?list=PL2We04F3Y_43dAehLMT5GxJhtk3mJtkl5)
        - [TheDevOpsSchool - Certified Kubernetes Administrator (CKA) 2019 Tutorials](https://www.youtube.com/playlist?list=PLDhScTEBdP8wE9gl8PkZu5dfHSCNI0UvL)
        - [Jérôme Petazzoni - [2019.03] Kubernetes workshop at QCON London](https://www.youtube.com/playlist?list=PLBAFXs0YjviJwCoxSUkUPhsSxDJzpZbJd)
        - [Microsoft Azure - Kubernetes Basics](https://www.youtube.com/playlist?list=PLLasX02E8BPCrIhFrc_ZiINhbRkYMKdPT)
        - [Google Cloud Platform - Kubernetes Best Practices](https://www.youtube.com/playlist?list=PLIivdWyY5sqL3xfXz5xJvwzFW_tlQB_GB)
        - [edureka! - Kubernetes Tutorial for Beginners](https://www.youtube.com/playlist?list=PL9ooVrP1hQOF907pPru97cKY9nKwOrDTP)

- Final Articles / Posts / Resources:
    - 2019-12-12 - [Demystifying Kubernetes as a service – How Alibaba cloud manages 10,000s of Kubernetes clusters](https://www.cncf.io/blog/2019/12/12/demystifying-kubernetes-as-a-service-how-does-alibaba-cloud-manage-10000s-of-kubernetes-clusters/)
