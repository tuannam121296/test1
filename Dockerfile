FROM nginx:latest

COPY index.html /usr/share/nginx/html/index.html
COPY DockerFileEx.jpg /usr/share/nginx/html/DockerFileEx.jpg

EXPOSE 80

RUN ["ln", "-s", "/usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime"]