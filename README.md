# local-installation-of-devops-tools
🚀 Multi-Node DevOps Stack on Kubernetes (Minikube)This project automates the deployment of a full-scale DevOps ecosystem on a 3-node Kubernetes cluster using Minikube.
It demonstrates infrastructure-as-code (IaC) principles by provisioning CI/CD, Code Quality, and Monitoring tools using pure Kubernetes Manifests.🏗️ Architecture OverviewThe cluster consists of one Control Plane and two Worker Nodes. 
The scheduler is configured to distribute the "heavy" DevOps tools across the nodes to ensure high availability and resource balance.
Cluster Orchestrator: Minikube (3-node configuration)Driver: DockerNodes: 1 Master, 2 Workers🛠️ The DevOps Tech StackToolCategoryRoleJenkinsCI/CDAutomates build and deployment pipelines.SonarQubeCode QualityStatic analysis and security gate scanning.PrometheusMonitoringTime-series database for cluster metrics.GrafanaObservabilityDashboard visualization for system health.

🚀 Getting StartedPrerequisitesUbuntu 24.04 (or compatible Linux distro)Docker Engine installed and runningMinikube & kubectl installedMinimum 8GB RAM and 4 CPUs availableOne-Click InstallationClone the repository:Bashgit clone https://github.com/beastguhan/devops-3node-stack.git
cd devops-3node-stack
Execute the setup script:Bashchmod +x setup.sh
./setup.sh

🌐 Accessing the DashboardsSince the cluster runs inside the Docker driver network, use kubectl port-forward to bridge the services to your local machine:
ToolPort-Forward CommandURLJenkinskubectl port-forward svc/jenkins-svc 8080:8080
http://localhost:8080SonarQubekubectl port-forward svc/sonar-svc 9000:9000
http://localhost:9000Grafanakubectl port-forward svc/monitoring-svc 3000:3000
http://localhost:3000🔍 Key DevOps Concepts ImplementedMulti-Node Scheduling: Demonstrates how Kubernetes distributes pods across m01, m02, and m03 nodes.Declarative Infrastructure: Entire stack is defined via YAML manifests, ensuring version control and reproducibility.Service Discovery: Uses NodePort and ClusterIP services to enable communication between Jenkins and SonarQube.Resource Management: Configured SonarQube environment variables to handle Elasticsearch bootstrap checks in a containerized environment.📝 CredentialsSonarQube: admin / admin (Reset required on first login)Grafana: admin / adminJenkins: Retrieve the initial password via:Bashkubectl logs deployment/jenkins | grep "Initial Admin Password"
