# How To Use
Each directory contain Dockerfile that is used to build docker image. 

Clone git
```sh
$ git clone <git-url>
```

Build docker image
````sh
$ cd <directory>
$ docker build -t <tag-name> .
or <hub-username>/<repo-name>:<tag>
$ docker build -t <tag-name> .
````

If you want push image to docker hub,  make sure you naming images with format 
> [hub-username]/[repo-name]:[tag]

