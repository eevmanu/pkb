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
    - [kelseyhightower/kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way/) - Bootstrap Kubernetes the hard way on Google Cloud Platform. No scripts.
    - [kubernetes/minikube](https://github.com/kubernetes/minikube) - Run Kubernetes locally
    - [helm/helm](https://github.com/helm/helm) - The Kubernetes Package Manager
    - [helm/charts](https://github.com/helm/charts) - Curated applications for Kubernetes
    - [rancher/k3s](https://github.com/rancher/k3s) - Lightweight Kubernetes
    - [google/gvisor](https://github.com/google/gvisor) - Application Kernel for Containers
    - [GoogleContainerTools/skaffold](https://github.com/GoogleContainerTools/skaffold) - Easy and Repeatable Kubernetes Development
    - [kubernetes-sigs/kubespray](https://github.com/kubernetes-sigs/kubespray) - Deploy a Production Ready Kubernetes Cluster
    - [derailed/k9s](https://github.com/derailed/k9s) - Kubernetes CLI To Manage Your Clusters In Style!
    - [lensapp/lens](https://github.com/lensapp/lens) - Lens - The Kubernetes IDE
    - [kubernetes/dashboard](https://github.com/kubernetes/dashboard) - General-purpose web UI for Kubernetes clusters
    - [ahmetb/kubectx](https://github.com/ahmetb/kubectx) - Faster way to switch between clusters and namespaces in kubectl
    - [knrt10/kubernetes-basicLearning](https://github.com/knrt10/kubernetes-basicLearning/) - Understand kubernetes step by step. A simple repo for beginners
    - [hobby-kube/guide](https://github.com/hobby-kube/guide) - Kubernetes clusters for the hobbyist.
    - [The Kubernetes Learning Resources List](https://docs.google.com/spreadsheets/d/10NltoF_6y3mBwUzQ4bcQLQfCE1BWSgUDcJXy-Qp2JEU/) by [kubernauts](https://twitter.com/kubernauts)
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

- Needs contribution:
    - [kubernetes/test-infra](https://github.com/kubernetes/test-infra) - Test infrastructure for the Kubernetes project.
    - [kubernetes/enhancements](https://github.com/kubernetes/enhancements) - Enhancements tracking repo for Kubernetes
    - [testgrid - k8s](https://testgrid.k8s.io/) -
    - [kubernetes-sigs/aws-alb-ingress-controller](https://github.com/kubernetes-sigs/aws-alb-ingress-controller)
    - [kubernetes-sigs/aws-iam-authenticator](https://github.com/kubernetes-sigs/aws-iam-authenticator)
    - [kubernetes-sigs/bootkube](https://github.com/kubernetes-sigs/bootkube)
    - [kubernetes-sigs/cluster-api](https://github.com/kubernetes-sigs/cluster-api)
    - [kubernetes-sigs/descheduler](https://github.com/kubernetes-sigs/descheduler)
    - [kubernetes-sigs/external-dns](https://github.com/kubernetes-sigs/external-dns)
    - [kubernetes-sigs/kind](https://github.com/kubernetes-sigs/kind)
    - [kubernetes-sigs/krew](https://github.com/kubernetes-sigs/krew)
    - [kubernetes-sigs/kubebuilder](https://github.com/kubernetes-sigs/kubebuilder)
    - [kubernetes-sigs/kubefed](https://github.com/kubernetes-sigs/kubefed)
    - [kubernetes-sigs/kubespray](https://github.com/kubernetes-sigs/kubespray)
    - [kubernetes-sigs/kustomize](https://github.com/kubernetes-sigs/kustomize)
    - [kubernetes-sigs/metrics-server](https://github.com/kubernetes-sigs/metrics-server)


    - 2019-12-12 - [Demystifying Kubernetes as a service – How Alibaba cloud manages 10,000s of Kubernetes clusters](https://www.cncf.io/blog/2019/12/12/demystifying-kubernetes-as-a-service-how-does-alibaba-cloud-manage-10000s-of-kubernetes-clusters/)
