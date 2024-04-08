sudo yum install docker -y
sudo systemctl enable docker && systemctl start docker
sudo touch /etc/yum.repos.d/kubernetes.repo
echo "[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.28/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.28/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni " >>  /etc/yum.repos.d/kubernetes.repo

sudo touch /etc/sysctl.d/k8s.conf
echo " net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system
setenforce 0" >> /etc/sysctl.d/k8s.conf
sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
sudo systemctl enable kubelet && systemctl start kubelet
