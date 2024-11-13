sudo kubeadm init --ignore-preflight-errors=all
sudo mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo export KUBECONFIG=/etc/kubernetes/admin.conf
sudo kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.29.0/manifests/calico.yaml
echo " Copy This Token And Paste it in worker Node
******************************************************************************************************* "
sudo kubeadm token create --print-join-command
sudo echo "******************************************************************************************************"
