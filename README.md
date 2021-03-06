# Dockerfile and container setup for Jupyter Notebook & Pandas standard container

## 1. Clone repo

## 2. Create docker image 
a. `cd` to locally cloned repo and find the directory root which has the data you want to mount in container\
b. Open terminal in this directory\
c. Build the container image using the following command:

    docker build -t notebook_pandas:0.1 . -f dockerfile
* `-t` = create a tag name for the image
* `-f` dockerfile = path to dockerfile this can be located anywhere and does not have to be mixed with data you want to mount in container

## 3. Create container based on docker image

Use the following docker run command AFTER image has been created with dockerfile:

    docker run -p 9999:8888 -v /path/to/data:/app --name <GIVETHECONTAINERANAME> <1d6bdefef40b OR note_dev:0.1>

#### Breakdown of what is happening in the docker run command above:
* `docker run`  = starting docker container
* `-p 9999:8888`    = ports local:container
* `-v /home/ubuntuuser/Documents/NotebookDevEnv/data:/app/data` = mounting volumes LocalFolderPath:ContainerMountFolderPath
* `--name testContainer`    = giving the container a name
* `1d6bdefef40b`    = image id (changes everytime the container restarts)
* OR `notebook_pandas:0.1` = OR REPOSITORY:TAG which you can find with the `docker images` command 
