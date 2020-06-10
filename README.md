# django-docker-postgres-start-up
A simple Django starting point using Docker containers for the App and DB

For this project to start we need some stuff before hand.

## Contets
### 1. Need First
### 2. Download Containers and Install
______
## 1. Need First

For this to happend we need to:
- Install [homebrew](https://brew.sh/index_es). Once you have it, remember to insert the Homebrew directory at the top of your **PATH** environment variables by adding the following line at the botom of you `~./profile` file
```bash
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
```
- Install Python using homebrew 
```bash
$ brew install python
```
Check which version of Python you have, you could:
```bash
$ python --version
*Python 3.8.x # Success!*
```
Make sure you have **pip** installed, hopefully if you use homebrew for **python** installation, you'll have it already.
```bash
$ pip --version
```
Now we need **Pipenv**, this is a useful tool for development, to you create an isolated environment where you install all the packages for your project and not on the machine, you'll know which version you're using for an specific app, and, due to the use of Docker, it will be easy to deploy and work, so let's go and install Pipenv.
```bash
$ pip install --user pipenv
```
You'll find useful information in [this page](https://docs.python-guide.org/dev/virtualenvs/#virtualenvironments-ref). We'll see next how to create and activate the environment.

Now we'll need Docker. Since I'm currently working on a Mac, I just download the [Docker Desktop](https://docs.docker.com/docker-for-mac/install/) and I'm done, it already includes Docker and Docker Compose, If you are in Linux you'll have to install Docker and Docker Compose on two different steps, [this link](https://docs.docker.com/engine/install/ubuntu/) could help.

Since we are going to use a Postgres DB inside a container, it's not mandatory to download and install Postgres to your local machine, but it you want not to use the Docker container, you could read the documentation [here](https://www.postgresql.org/download/) and download using **brew**.
```bash
$ brew install postgres
```

Now we are set!

## 2. Download Containers and Install

First clone the repo
```bash
$ git clone https://github.com/FernandoZnga/django-docker-postgres-start-up <my_project_name>
$ cd <my_project_name>
```

Check your local root folder, it should be like this
```bash
makefiles
    >database.mk
    >server.mk
.gitignore
Dockerfile
LICENCE
Makefile
README.md
requirements-dev.txt
requirements.txx
```
Before going any further, let me quick-explain your root folder.

- `makefiles` folder contain some commands you could use just typing `make <command>` you could find the list of commands on the **Makefile**, just do a quick read.
- `Dockerfile` as the name suggest, is for Docker and it tells which folders are going to be copied and sync from local to container.
- `docker-compose.yml` tells Docker what how many containers we are going to use and what images.
- `requirements-dev.txt` contains the list of packages you could use while you are developing the app.
- `requirements.txt` contains the list of packages you'll be using for production.

As you can see, at the moment, `requirements-dev.txt` is empty and it only purpose is to redirects the installation of packages to `requirements.txt`

At this poing you have all you need to download and install, so Let's Start!

Let's create and activate a virutal envinroment:
```bash
python -m venv env
source env/bin/activate
```
You'll se the word `(env)` in your command line.

Then create a **.env** empty file, then run the `sudo docker-compose` command.
```bash
$ touch .env  ## creates the .env empty file
$ sudo docker-compose run web django-admin startproject myapp .  ## myapp can be changed to your app name
```
It will download the images, create the containers and install dependencies, basically Django & psycopg2, then creates the project.

After that, you'll se a bunch of new folders, try to start the app running this from the root folder (where Makefile is):
```bash
$ make start
```
You should see the server running on your [localhost](http://localhost:8000/)

If you want to go beyond, I'll encourage you to follow [Writing your first Django app](https://docs.djangoproject.com/en/3.0/intro/tutorial01/) tutorial.

Happy Coding!