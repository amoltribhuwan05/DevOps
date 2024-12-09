<h1>Nifi & Nifi Registry Configration</h1>
<ul>
<li><b> Enviorment Setup</b></li>
<ul>
<p><li>📁 Directory Structure</p></li>

```bash
mnt
├── nifi-data
├── nifi-registry-data
└── nifi-shares
    ├── nifi-dumps
    ├── repos 
    └── venv
```

<b>nifi-data:</b> This directory used to persist the nifi container data if the container is is fails or remove the nifi container data is remains persistant enevn after the new <code>nifi docker container creates</code>.

<b>nifi-registry-data:</b>Same as above this directory persists data of the nifi-registry container.

<b>nifi-shares:</b> This directory is user specific directory here we store the code and python vertual envirnment.
<ul>
<li><b>nifi-dumps:</b></li> Upload the csv files to be processed.
<li><b>repos:</b></li> Inside this directory we clone the git repository which have the python scripts.
<li><b>venv:</b></li> Pyhton Virtual Enviornment it contains all python pip packages this create this directory using.

```bash
python3 -m venv venv
```
<p> You Can Create above structure using following comands one by one.</p>

```bash
cd / #change the current working directory to /
sudo mkdir /mnt # create mnt directory if not exists
cd /mnt ##change the current working directory to /
sudo mkdir nifi-data nifi-registry-data nifi-shares #create the nifi-data,nifi-registry-data,nifi-shares directories.
sudo mkdir -p nifi-shares/nifi-dumps nifi-shares/repos  #create the nifi-dumps,repos directories.
sudo python3 -m venv venv #create python venv vertual enviornment
sudo chown -R $USER:$USER nifi-data nifi-registry-data nifi-shares venv #change the ownership to the current user and current group.
```
</ul>

<p><li>Python Ennvioroment setup</p></li>
<p> activate the virtual envirment using this command.</p>

```bash
source venv/bin/activate
```
<p>switch your current directory to the directory where your requirments.txt is located and install the requirments.txt</p>

```bash
pip3 install -r requirnments.txt
```
<p> deactivate the virual enviornment</p>

```bash
deactivate
```

</ul>
<li><b> Docker File Tree </b> </li>
<ul>

```bash
nifi
├── Dockerfile
└── docker-compose.yaml
```
<p>create nifi directory according to your specific path</p>
<p><li> <b>Dockerfile:</b> This file used to pull the <code>apache/nifi:latest</code> Docker image & build Customize docker image according to our python code.

```Dockerfile
# Use the official NiFi image as the base image
FROM apache/nifi:latest

# Switch to root user
USER root
 
# Install Os level Requirments
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev python3-dev python3 libssl-dev libffi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# Switch back to nifi user
USER nifi

#add python path
ENV PATH=/opt/myenv/bin:$PATH

# Expose NiFi web UI port
EXPOSE 8080 8443

# Default command to run NiFi
CMD ["./scripts/start.sh"]

```
</p></li>
<p><li>
<b>docker-compose.yaml:</b> Configration of the <code>nifi</code> and <code>nifi-registry</code>.
</li></p>

```yaml
services:
  nifi:                                                         #Nifi Application
    build: .
    container_name: nifi                                        #container Name
    restart: always                                             #Restart policy
    ports:
      - 8081:8080                                               #Host_Port:Container_path ,nifi will be access over the port number 8081
    environment:
      SINGLE_USER_CREDENTIALS_USERNAME: admin                   #NIFI_username
      SINGLE_USER_CREDENTIALS_PASSWORD: Polarisnifi@47          #NIFI_Password
      NIFI_WEB_HTTP_PORT: 8080                                  #NIFI_HTTP_PORT
      NIFI_WEB_PROXY_HOST: <server_ip>:8081

    volumes:
      - nifi-data:/opt/nifi/nifi-current/                       #NIFI Application data
      - /mnt/nifi-shares/repos:/scripts                         #Git Repositories for Python Scripts
      - /mnt/nifi-shares/nifi-dumps:/nifi-dumps                 #CSV Files To be Processed
      - /mnt/nifi-shares/venv:/opt/myenv                        #Python Virtual enviorment mounted to nifi to use external python

  nifi-registry:                                                #Nifi Registry
    image: apache/nifi-registry:latest                          #Docker image for Nifi Registry
    container_name: nifi-registry                               #container Name
    restart: always                                             #Restart Policy
    ports:
      - 19090:19090                                             #Host_Port:Container_path , nifi registry will be access over the port number 19090
    environment:
      NIFI_REGISTRY_WEB_HTTP_PORT: 19090                        #Nifi Registry HTTP PORT
      NIFI_REGISTRY_WEB_HTTPS_PORT: 18443                       #Nifi Registry HTTPS PORT
    volumes:
      - nifi-registry-data:/opt/nifi-registry/nifi-registry-current/   # #NIFI Application data

volumes:
  nifi-data:
    driver: local
    driver_opts:
      type: none
      device: /mnt/nifi-data
      o: bind
  nifi-registry-data:
    driver: local
    driver_opts:
      type: none
      device: /mnt/nifi-registry-data
      o: bind
```
<p>Run the Application</p>

```bash
docker compose up -d
```

<p>Stop the Application</p>

```bash
docker compose down
```
</ul>


<ul>
<li><b>Nifi Basic details</b></li>
<table border=1>
<tr>
<th>variables</th>
<th>values</th>
</tr>
<tr>
<td>ACCESS URL</td>
<td>http://&lt;server_ip&gt;:8081</td>
</tr>
<tr>
<td>Python Command Path</td>
<td>/opt/myenv/bin/python3</td>
</tr>
<tr>
<td>Python workspace repository</td>
<td>/scripts</td>
</tr>
<tr>
<td>CSV files dumping path </td>
<td>/nifi-dumps</td>
</tr>
</table>
</ul>
<ul>
<li><b>Nifi Registry Basic details</b></li>
<table border=1>
<tr>
<th>variables</th>
<th>values</th>
</tr>
<tr>
<td>ACCESS URL</td>
<td>http://&lt;server_ip&gt;:19090</td>
</tr>
</table>

</ul>
</ul>