# Self Hosted Github Runners as Docker Containers <img src=https://www.docker.com/app/uploads/2024/01/icon-docker-square.svg></img>

### Features
<ol><li>
<p>Register the Self hosted GitHub Runner as docker containers.</p>
</li>
<li><p>Deregister When dont have to use or docker container is stopped for removing offline runners from github.</p></li>
<li><p>build also on your machine don't need to be pull from container registry.</p></li>
</ol>

### Build

<ol>
<li><p>
Clone the GitHub Repo.

```sh
git clone amoltribhuwan05/DevOps.git
```
</p></li>

<li><p>
change the directory to `action-runners`

```sh
cd action-runners/
```
</p></li>

<li><p>
build the docker image

```sh
sudo chmod +x build.sh
bash ./build.sh
```
this will be generate a docker image named as `actions-runner` 
</p></li>
</ol>

### Register Runner from docker-compose

<ol>
<li><p>
create a github pearsonal access token
</p></li>
<li><p>
update the `docker-compose.yaml` with following variables

```sh
      - REPO=< USERNAME >/< REPO >
      - TOKEN=< Github Personal Access TOKEN >
```
update this with repository name and pearsonal access token.
</p></li>
<li><p>
create containers.

```sh
docker compose up -d
```
</p></li>
</ol>

### ENVIORNMENT VARIABLE
<table border=2>
<tr>
<th>sr.no</th>
<th>variable</th>
<th>value</th>
</tr>
<tr>
<td>1</td>
<td>REPO</td>
<td>(username/owner)/repository.git</td>
</tr>
<tr>
<td>2</td>
<td>TOKEN</td>
<td>github PAT</td>
</tr>
</table>

### requirments should be installed on machine
`docker, docker-compose, curl, git`

1. install docker & docker compose
```sh
curl https://get.docker.com | sh
```

2. install curl & git
```sh
#UBUNTU or Debian Based
sudo apt update
sudo apt install curl git -y
```

```sh
#Redhat Based
sudo yum update 
sudo yum install curl git -y
```

**_NOTE:_** To Register Multiple Runners replicate the service accoding to your service name and changet the cotainer name also mention an different volumes for different services

---
Made with ❤️ by [Amol](https://github.com/amoltribhuwan05).