# jenkins-docker
A small repository with Dockerfile's for Jenkins. It basically gives you a jenkins 2 environment with one slave and a one Gradle builder. There is also a demo project called [jenkins-docker-test](https://github.com/scav/jenkins-docker-test) used for testing and its a good place to start seeing how things are built.

A few things to consider before using this.
 * These images share unix:///var/run/docker.sock 
 * jenkins and jenkins-slave have docker installed
 * Security has not been a priority so far, and there are surely unresolved issues here
 * To enable Docker Pipeline Plugin containers have to be mounted at /var/jenkins_home since this plugin will try to mount the jenkins virtual path to the actual host path.
 * **Do not use this in production if you are unsure of the consequences of this!**

When running Jenkins locally on the host, make sure Jenkins is part of the docker group to give access to the docker socket.


## Building the images
Building the images is as easy as executing a bash script and providing some basic info, but first you should set up a repository.

#### Preparing a local repository (if you do not have one)
You should have a local repository running to make life easier for you. This is also a great way of getting to know how docker images work while having the ability to start over when ever you like.

Setting this up is as easy as 
```bash
docker run -d -p 5000:5000 --restart=always --name registry \
  -v `pwd`/data:/var/lib/registry \
  registry:2
```

#### Building the images
All images can be built by the same command if you want to. Just specify the name of your docker group and the repository you want to push images to after they are built.

In the root file of the project you will find a file named *build*. Use this to build the images. If you see some red text, that is normal, if it fails, however, you can just try again and it should work.
```bash
sh build docker localhost:5000
```

#### Building something
Here is an example job that can be built using the provided Gradle builder. Replace localhost:5000 with the path to your repository and it should build. It will not do more than build for now.
```bash
node('docker-slave') {
    docker.image('localhost:5000/gradle').inside {
        stage 'Checkout from git'
        git 'https://github.com/scav/jenkins-docker-test.git'
        stage 'Running tests'
        
        sh 'gradle clean build'
    }
}
```
## Plugins
The plugins.txt file is rather big, I just took everything from my jenkins install (used to make this) and dumped it into that file.

## Todo
In no particular order...
 * Add plugins.txt to [jenkins/Dockerfile](https://github.com/scav/jenkins-docker/blob/master/jenkins/Dockerfile)
 * Actually build something and push
 * Docker Compose
 * Some kind of automatic IP sharing of jenkins -> slaves
 * Better bash scripts
 * Security
 * More slaves