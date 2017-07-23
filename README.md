# docker-icecast

Standalone icecast server running on Centos<br>
<br>
Build this container using your own user by running:<br>
docker build -t --build-arg user=$YOUR_USER_NAME icecast .<br>
<i>you must be cd'd into the directory the dockerfile is in to run this command</i>
<br>
<br>
start this container locally by running:<br>
docker run -p 8000:8000 -d icecast<br>
<br>
After running 'docker run' go to your web browser and enter localhost:8000<br>