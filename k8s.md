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
    - 2020-11-09 - [Kubernetes Security Is Not Container Security](https://blog.alcide.io/kubernetes-security-is-not-container-security) - [archive](https://web.archive.org/web/20201122212942/https://blog.alcide.io/kubernetes-security-is-not-container-security) - [reddit](https://www.reddit.com/r/netsec/comments/jsvc6f/kubernetes_security_is_not_container_security/)
        - RedHat - [What is DevSecOps?](https://www.redhat.com/en/topics/devops/what-is-devsecops)

- Gateway / Proxy:
    - [traefik/traefik](https://github.com/traefik/traefik) - The Cloud Native Application Proxy
    - [Kong/kong](https://github.com/Kong/kong) - The Cloud-Native API Gateway
    - [istio/istio](https://github.com/istio/istio) - Connect, secure, control, and observe services.

- IaaS:
    - [pulumi/pulumi](https://github.com/pulumi/pulumi) - Pulumi - Modern Infrastructure as Code. Any cloud, any language

- Cheat Sheet
    - [kubectl](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
    - [LeCoupa/awesome-cheatsheets](https://github.com/LeCoupa/awesome-cheatsheets) - Awesome cheatsheets for popular programming languages, frameworks and development tools. They include everything you should know in one single file.
        - [tools/kubernetes](https://github.com/LeCoupa/awesome-cheatsheets/blob/master/tools/kubernetes.md)

- Github:
    - [pixie](https://github.com/pixie-labs/pixie) - Instant Kubernetes-Native Application Observability
    - [kubernetes/test-infra](https://github.com/kubernetes/test-infra) - Test infrastructure for the Kubernetes project.
    - [kubeedge/kubeedge](https://github.com/kubeedge/kubeedge) - Kubernetes Native Edge Computing Framework (project under CNCF)
    - [ramitsurana/awesome-kubernetes](https://github.com/ramitsurana/awesome-kubernetes) - A curated list for awesome kubernetes sources
    - [kubeflow/kubeflow](https://github.com/kubeflow/kubeflow) - Machine Learning Toolkit for Kubernetes
    - [GoogleContainerTools/kaniko](https://github.com/GoogleContainerTools/kaniko) - Build Container Images In Kubernetes
    - [cncf/landscape](https://github.com/cncf/landscape) - The Cloud Native Interactive Landscape filters and sorts hundreds of projects and products, and shows details including GitHub stars, funding or market cap, first and last commits, contributor counts, headquarters location, and recent tweets.


- CKA / CKAD
    - 2020-10-19 - [The Ultimate Guide to pass the New CKA exam released at September 2020](https://www.reddit.com/r/kubernetes/comments/jdzv77/the_ultimate_guide_to_pass_the_new_cka_exam/)
    - 2020-09-24 - [CKAD Certification Exam Preparation Guide and Tips](https://kloudnative.blogspot.com/2020/09/ckad-certification-exam-preparation.html)
    - Github:
        - [dgkanatsios/CKAD-exercises](https://github.com/dgkanatsios/CKAD-exercises) - A set of exercises to prepare for Certified Kubernetes Application Developer exam by Cloud Native Computing Foundation
        - [walidshaari/Kubernetes-Certified-Administrator](https://github.com/walidshaari/Kubernetes-Certified-Administrator) - Online resources that will help you prepare for taking the CNCF CKA 2020 "Kubernetes Certified Administrator" Certification exam. with time, This is not likely the comprehensive up to date list - please make a pull request if there something that should be added here.
        - [kodekloudhub/certified-kubernetes-administrator-course](https://github.com/kodekloudhub/certified-kubernetes-administrator-course) - Certified Kubernetes Administrator - CKA Course
        - [twajr/ckad-prep-notes](https://github.com/twajr/ckad-prep-notes) - List of resources and notes for passing the Certified Kubernetes Application Developer (CKAD) exam.
        - [lucassha/CKAD-resources](https://github.com/lucassha/CKAD-resources) - Study materials for k8s CKAD
    - YouTube
        - [TheDevOpsSchool - Certified Kubernetes Administrator (CKA) 2019 Tutorials](https://www.youtube.com/playlist?list=PLDhScTEBdP8wE9gl8PkZu5dfHSCNI0UvL)

- YouTube:
    - Video:
        - [CNCF [Cloud Native Computing Foundation] - Webinar: You can be a Kubernetes contributor too!](https://www.youtube.com/watch?v=o68ff5NokR8)
        - [Monitoring your GKE costs](https://www.youtube.com/watch?v=lC7LSUlZ4A8)
    - Playlists:
        - [KodeKloud - Kubernetes for the Absolute Beginners](https://www.youtube.com/playlist?list=PL2We04F3Y_43dAehLMT5GxJhtk3mJtkl5)
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
        - [kind](https://kind.sigs.k8s.io/) is a tool for running local Kubernetes clusters using Docker container “nodes”.
    - [kubernetes-sigs/krew](https://github.com/kubernetes-sigs/krew)
    - [kubernetes-sigs/kubebuilder](https://github.com/kubernetes-sigs/kubebuilder)
    - [kubernetes-sigs/kubefed](https://github.com/kubernetes-sigs/kubefed)
    - [kubernetes-sigs/kubespray](https://github.com/kubernetes-sigs/kubespray)
    - [kubernetes-sigs/kustomize](https://github.com/kubernetes-sigs/kustomize)
    - [kubernetes-sigs/metrics-server](https://github.com/kubernetes-sigs/metrics-server)

- Useful Articles / Posts:
    - 2019-12-12 - [Demystifying Kubernetes as a service – How Alibaba cloud manages 10,000s of Kubernetes clusters](https://www.cncf.io/blog/2019/12/12/demystifying-kubernetes-as-a-service-how-does-alibaba-cloud-manage-10000s-of-kubernetes-clusters/)
    - 2020-10-29 - [Container Orchestration Tools Explained](https://scoutapm.com/blog/container-orchestration-tools-explained)
