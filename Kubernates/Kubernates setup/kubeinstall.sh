sudo yum install docker -y
sudo systemctl enable docker && systemctl start docker
sudo touch /etc/yum.repos.d/kubernetes.repo
echo "[kubernetes]

name=Kubernetes

baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64

enabled=1

gpgcheck=1

repo_gpgcheck=0

gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg

exclude=kube* " >>  /etc/yum.repos.d/kubernetes.repo

sudo touch /etc/sysctl.d/k8s.conf
echo " net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system
setenforce 0" >> /etc/sysctl.d/k8s.conf
sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
sudo systemctl enable kubelet && systemctl start kubelet
