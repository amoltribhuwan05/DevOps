<h1>Kubernates Master Node Installation.</h1>
<li>You have to open the SG port no <b>6443</b> in the master node</li>
<li>copy the kubeinstall.sh file content</li>
<li>login as superuser using sudo su </li>
<li>create new shell script file nano kubeinstall.sh</li>
<li>create another new shell script file nano kubemaster.sh</li>
<li>give the execution permission to the files sudo chmod +x kubeinstall.sh kubemaster.sh</li>
<li>run the kubeinstall.sh file and wait for installation</li>
<li>after fininshing the  installation run the next kubester.sh file</li>
<li>copy the generated token in the master node</li>

<h1>Kubernates Worker Node Setup.</h1>
<li>You have to open the SG port no <b>10250</b> in the worker node</li>
<li>copy the kubeinstall.sh file content</li>
<li>login as superuser using sudo su</li>
<li>create new shell script file nano kubeinstall.sh</li>
<li>give the execution permission to the files sudo chmod +x kubeinstall.sh</li>
<li>run the kubeinstall.sh file and wait for installation</li>
<li>paste the generated token in the master node</li>
