FROM ubuntu:14.04

MAINTAINER manuel.vacelet@enalean.com
# Inspired from https://github.com/jwilder/nginx-proxy

# Update base
RUN apt-get update
RUN apt-get upgrade -y

# Nginx
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:nginx/stable

RUN apt-get update

RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN apt-get install -y supervisor
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf

RUN apt-get install -y inotify-tools
ADD . /app
WORKDIR /app

VOLUME ["/mnt"]

EXPOSE 80

CMD ["./run.sh"]
