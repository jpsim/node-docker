# Node.js Docker

Demo Node.JS App using Docker

## Dockerfile

Use this to build a new image

    $ sudo docker build .

With a tag for easier reuse

    $ sudo docker build  -t <your username>/node-docker .

Running the container

    $ sudo docker run -d -p 80:8000 <your username>/node-docker

Now go to `<your ip>` in your browser
