### Commands

```bash
$ kubectl exec -it {{ }} --container {{ }} -- /bin/bash

$ kubectl port-forward {{ }} 3000:3000

$ kubectl config get-contexts
$ kubectl config current-context
$ kubectl config use-context {{ }}

$ kubectl logs -f --tail=10 {{ }}
```

### Microservice Terminology

- api gateway
- load balancer
- reverse proxy
- forward proxy (or proxy)
- service discovery
- service registry
- service proxy
- service mesh (smart proxies)
    - data plane (move the data)
    - control plane (apply the desired policies by pushing configuration out to the smart proxies)
    - linkerd as daemon set
    - envoy as sidecar container
    - istio
- sidecar proxy

- Resources
    - [What Is A Reverse Proxy? | Proxy Servers Explained](https://www.cloudflare.com/learning/cdn/glossary/reverse-proxy/)
    - [SO: What is service discovery, and why do you need it?](https://stackoverflow.com/questions/37148836/what-is-service-discovery-and-why-do-you-need-it)
    - 2015 - [Service Discovery in a Microservices Architecture](https://www.nginx.com/blog/service-discovery-in-a-microservices-architecture/)
    - [What is a “mesh”?](https://devops.stackexchange.com/questions/5374/what-is-a-mesh)
    - [SO: What is a service mesh?](https://stackoverflow.com/questions/60150198/what-is-a-service-mesh)

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

- [Concepts](https://kubernetes.io/docs/concepts/)
    - Overview
    - Cluster Architecture
    - Containers
    - Workloads
    - Services, Load Balancing, and Networking
    - Storage
    - Configuration
    - Security
    - Policies
    - Scheduling and Eviction
    - Cluster Administration
    - Extending Kubernetes

- Operators:
    - [kubernetes/kops](https://github.com/kubernetes/kops) - Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management
    - [zalando/postgres-operator](https://github.com/zalando/postgres-operator)
    - [CrunchyData/postgres-operator](https://github.com/CrunchyData/postgres-operator)
    - [prometheus-operator/prometheus-operator](https://github.com/prometheus-operator/prometheus-operator) - Prometheus Operator creates/configures/manages Prometheus clusters atop Kubernetes
    - [operator-framework/operator-sdk](https://github.com/operator-framework/operator-sdk) - SDK for building Kubernetes applications. Provides high level APIs, useful abstractions, and project scaffolding.

- Databases / Storage:
    - [etcd-io/etcd](https://github.com/etcd-io/etcd) - Distributed reliable key-value store for the most critical data of a distributed system.
    - [minio/minio](https://github.com/minio/minio) - High Performance, Kubernetes Native Object Storage
    - [vitessio/vitess](https://github.com/vitessio/vitess) - Vitess is a database clustering system for horizontal scaling of MySQL.
    - [rook/rook](https://github.com/rook/rook) - Storage Orchestration for Kubernetes

- Security:
    - [docker/docker-bench-security](https://github.com/docker/docker-bench-security) - script that checks for dozens of common best-practices around deploying Docker containers in production.
    - [quay/clair](https://github.com/quay/clair) - Vulnerability Static Analysis for Containers
    - [aquasecurity/trivy](https://github.com/aquasecurity/trivy) - A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI

- Gateway / Proxy:
    - [traefik/traefik](https://github.com/traefik/traefik) - The Cloud Native Application Proxy
    - [Kong/kong](https://github.com/Kong/kong) - The Cloud-Native API Gateway
    - [istio/istio](https://github.com/istio/istio) - Connect, secure, control, and observe services.

- IaaS:
    - [pulumi/pulumi](https://github.com/pulumi/pulumi) - Pulumi - Modern Infrastructure as Code. Any cloud, any language

- Github:
    - [pixie](https://github.com/pixie-labs/pixie) - Instant Kubernetes-Native Application Observability
    - [kubernetes/test-infra](https://github.com/kubernetes/test-infra) - Test infrastructure for the Kubernetes project.
    - [kubeedge/kubeedge](https://github.com/kubeedge/kubeedge) - Kubernetes Native Edge Computing Framework (project under CNCF)
    - [LeCoupa/awesome-cheatsheets](https://github.com/LeCoupa/awesome-cheatsheets) - Awesome cheatsheets for popular programming languages, frameworks and development tools. They include everything you should know in one single file.
    - [ramitsurana/awesome-kubernetes](https://github.com/ramitsurana/awesome-kubernetes) - A curated list for awesome kubernetes sources
    - [kubeflow/kubeflow](https://github.com/kubeflow/kubeflow) - Machine Learning Toolkit for Kubernetes
    - [GoogleContainerTools/kaniko](https://github.com/GoogleContainerTools/kaniko) - Build Container Images In Kubernetes

- YouTube:
    - Video:
        - [CNCF [Cloud Native Computing Foundation] - Webinar: You can be a Kubernetes contributor too!](https://www.youtube.com/watch?v=o68ff5NokR8)
    - Playlists:
        - [KodeKloud - Kubernetes for the Absolute Beginners](https://www.youtube.com/playlist?list=PL2We04F3Y_43dAehLMT5GxJhtk3mJtkl5)
        - [TheDevOpsSchool - Certified Kubernetes Administrator (CKA) 2019 Tutorials](https://www.youtube.com/playlist?list=PLDhScTEBdP8wE9gl8PkZu5dfHSCNI0UvL)
        - [Jérôme Petazzoni - [2019.03] Kubernetes workshop at QCON London](https://www.youtube.com/playlist?list=PLBAFXs0YjviJwCoxSUkUPhsSxDJzpZbJd)
        - [Microsoft Azure](https://www.youtube.com/c/MicrosoftAzure) - [Kubernetes Basics](https://www.youtube.com/playlist?list=PLLasX02E8BPCrIhFrc_ZiINhbRkYMKdPT)
        - [Google Cloud Platform - Kubernetes Best Practices](https://www.youtube.com/playlist?list=PLIivdWyY5sqL3xfXz5xJvwzFW_tlQB_GB)
        - [edureka! - Kubernetes Tutorial for Beginners](https://www.youtube.com/playlist?list=PL9ooVrP1hQOF907pPru97cKY9nKwOrDTP)
        - [TechWorld with Nana] -- [Complete Kubernetes Tutorial for Beginners](https://www.youtube.com/playlist?list=PLy7NrYWoggjziYQIDorlXjTvvwweTYoNC)

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


- Useful Articles / Posts:
    - 2019-12-12 - [Demystifying Kubernetes as a service – How Alibaba cloud manages 10,000s of Kubernetes clusters](https://www.cncf.io/blog/2019/12/12/demystifying-kubernetes-as-a-service-how-does-alibaba-cloud-manage-10000s-of-kubernetes-clusters/)
