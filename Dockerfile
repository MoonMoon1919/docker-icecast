FROM centos:latest
MAINTAINER M.Moon

##Prep the system
RUN yum update -y \
	&& yum groupinstall -y "Development Tools" \
	&& yum install -y \
		epel-release \
	&& yum clean all

##Install Icecast 
RUN yum install -y icecast

##Add user and switch users
RUN useradd -rm max 
USER max

##Make Documents directory and copy icecast config file
WORKDIR /home/max
RUN mkdir Documents
COPY icecast.xml /home/max/Documents/

##Change to root user to make permissions changes
USER root
RUN chmod u+x /home/max/Documents/icecast.xml

##Add logs
WORKDIR /var/log/icecast
RUN umask 000 \
	&& touch \
	access.log \
	error.log \
	playlist.log

#Adjust ownership of Icecast
RUN chown max:max -R /var/log/icecast

USER max

##Expose port 8000 in the container
EXPOSE 8000
VOLUME ["/var/log/icecast"]

##Add icecas start to container launch
CMD icecast -c /home/max/Documents/icecast.xml